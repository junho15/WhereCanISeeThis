import UIKit
import MovieDatabaseAPI

final class SimilarViewModel<Type: MediaProtocol> {

    // MARK: Properties

    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private let mediaItem: any MediaItemProtocol
    private var pages: [Page<Type>]
    private var genresList: GenreList?
    private var onError: ((String) -> Void)?

    private var mediaType: MediaType {
        return mediaItem.mediaType
    }
    private var mediaID: MediaItem.ID {
        return mediaItem.id
    }
    private var similarMedia: [Type] {
        return pages.flatMap { $0.results }
    }
    private var similarMediaIDs: [MediaItem.ID] {
        return similarMedia.map { $0.id }.deduplicate()
    }
    private var lastPage: Int {
        return pages.last?.page ?? 0
    }
    private var totalPage: Int {
        return pages.first?.totalPages ?? 1
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

    // MARK: Lifecycle

    init(
        movieDatabaseAPIClient: MovieDatabaseAPIClient = .init(apiKey: Secrets.apiKey),
        mediaItem: any MediaItemProtocol,
        pages: [Page<Type>] = [],
        genresList: GenreList? = nil,
        onError: ((String) -> Void)? = nil
    ) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
        self.mediaItem = mediaItem
        self.pages = pages
        self.genresList = genresList
        self.onError = onError
    }
}

// MARK: - Methods

extension SimilarViewModel: MediaItemViewModelProtocol {
    func fetchSimilarMedia() async -> [MediaItem.ID] {
        guard let languageCode,
              lastPage < totalPage else { return similarMediaIDs }
        do {
            switch mediaType {
            case .movie:
                if let language,
                   genresList == nil {
                    genresList = try await movieDatabaseAPIClient.fetchMovieGenresList(language: language)
                }
                guard let page = try await movieDatabaseAPIClient.fetchSimilarMovies(
                    movieID: mediaID, language: languageCode, page: lastPage + 1
                ) as? Page<Type> else { return similarMediaIDs }
                pages.append(page)
            case .tvShow:
                if let language,
                   genresList == nil {
                    genresList = try await movieDatabaseAPIClient.fetchTVShowGenresList(language: language)
                }
                guard let page = try await movieDatabaseAPIClient.fetchSimilarTVShows(
                    tvShowID: mediaID, language: languageCode, page: lastPage + 1
                ) as? Page<Type> else { return similarMediaIDs }
                pages.append(page)
            }
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
        }
        return similarMediaIDs
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }

    func mediaItem(for id: MediaItem.ID, type: MediaType? = nil) -> MediaItem? {
        guard let media = media(for: id) else { return nil }
        return MediaItem(media: media, genreList: genresList)
    }

    func image(imageSize: MovieDatabaseAPI.MovieDatabaseURL.ImageSize, imagePath: String) async -> UIImage? {
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

    func mediaDetailViewModel(for id: MediaItem.ID, type: MovieDatabaseAPI.MediaType? = nil) -> MediaDetailViewModel? {
        guard let mediaItem = mediaItem(for: id, type: mediaType) else { return nil }
        return MediaDetailViewModel(mediaItem: mediaItem)
    }

    func similarViewModel<T: MediaProtocol>(
        for id: MediaItem.ID, type: MovieDatabaseAPI.MediaType? = nil
    ) -> SimilarViewModel<T>? {
        guard let mediaItem = mediaItem(for: id) else { return nil }
        return SimilarViewModel(mediaItem: mediaItem, genresList: genresList) as? SimilarViewModel<T>
    }

    private func media(for id: MediaItem.ID) -> Type? {
        return similarMedia.first(where: { $0.id == id })
    }
}
