import UIKit
import MovieDatabaseAPI

final class SearchListViewModel<Type: MediaProtocol> {

    // MARK: Properties

    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private let mediaType: MediaType
    private var pages: [Page<Type>]
    private var genresList: GenreList?
    private(set) var query: String
    private var onError: ((String) -> Void)?

    var mediaItemIDs: [MediaItem.ID] {
        return mediaIDs.compactMap { $0 as? MediaItem.ID }
    }
    var itemCount: Int {
        return media.count
    }
    var itemTotalCount: Int {
        return pages.first?.totalResults ?? 0
    }
    private var media: [Type] {
        return pages.flatMap { $0.results }
    }
    private var mediaIDs: [Type.ID] {
        return media.map { $0.id }
    }
    private var language: String? {
        return Locale.current.language.languageCode?.identifier
    }
    private var country: String? {
        return Locale.current.language.region?.identifier
    }
    private var languageCode: String? {
        guard let language,
              let country else { return nil }
        return "\(language)-\(country)"
    }

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = .init(apiKey: Secrets.apiKey),
        query: String,
        mediaType: MediaType,
        pages: [Page<Type>] = [],
        genresList: GenreList? = nil,
        onError: ((String) -> Void)? = nil
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.query = query
        self.mediaType = mediaType
        self.pages = pages
        self.genresList = genresList
        self.onError = onError
    }
}

// MARK: - Methods

extension SearchListViewModel {
    func fetchNextPage() async -> [MediaItem.ID]? {
        guard let lastPage = pages.last?.page,
              let totalPages = pages.first?.totalPages,
              lastPage < totalPages else { return mediaItemIDs }
        do {
            let page: Page<Type>?
            switch mediaType {
            case .movie:
                page = try await movieDatabaseAPIClient.searchMovies(
                    query: query,
                    language: languageCode,
                    page: lastPage + 1
                ) as? Page<Type>
            case .tvShow:
                page = try await movieDatabaseAPIClient.searchTVShows(
                    query: query,
                    language: languageCode,
                    page: lastPage + 1
                ) as? Page<Type>
            }
            if let page { pages.append(page) }
            return mediaItemIDs
        } catch let error {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return mediaItemIDs
        }
    }

    func mediaItem(for id: MediaItem.ID) -> MediaItem? {
        guard let media = media.first(where: { $0.id == id }) else { return nil }
        return MediaItem(media: media, genreList: genresList)
    }

    func image(imageSize: MovieDatabaseURL.ImageSize, imagePath: String) async -> UIImage? {
        do {
            let image = try await movieDatabaseAPIClient.fetchImage(imageSize: imageSize, imagePath: imagePath)
            return image
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return nil
        }
    }

    func mediaDetailViewModel(for id: MediaItem.ID) -> MediaDetailViewModel? {
        switch mediaType {
        case .movie:
            return movieDetail(for: id)
        case .tvShow:
            return tvShowDetail(for: id)
        }
    }

    func similarViewModel(for id: MediaItem.ID) -> SimilarViewModel<Type>? {
        guard let mediaItem = mediaItem(for: id) else { return nil }
        return SimilarViewModel(mediaItem: mediaItem, genresList: self.genresList)
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    private func movieDetail(for id: Movie.ID) -> MediaDetailViewModel? {
        guard let movieItem = mediaItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: movieItem)
    }

    private func tvShowDetail(for id: TVShow.ID) -> MediaDetailViewModel? {
        guard let tvShowItem = mediaItem(for: id) else { return nil }
        return MediaDetailViewModel(mediaItem: tvShowItem)
    }
}
