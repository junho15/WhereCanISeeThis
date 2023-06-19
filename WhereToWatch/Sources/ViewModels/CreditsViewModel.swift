import UIKit
import MovieDatabaseAPI

final class CreditsViewModel {

    // MARK: Properties

    private let movieDatabaseAPIClient: MovieDatabaseAPIClient
    private var credits: [Credit] = []
    private var onError: ((String) -> Void)?
    private var creditIDs: [Credit.ID] {
        return credits.map { $0.id }
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

    init(movieDatabaseAPIClient: MovieDatabaseAPIClient = MovieDatabaseAPIClient(apiKey: Secrets.apiKey)) {
        self.movieDatabaseAPIClient = movieDatabaseAPIClient
    }
}

// MARK: - Methods

extension CreditsViewModel {
    func credit(for id: Credit.ID) -> Credit? {
        return credits.first(where: { $0.id == id })
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

    func fetchMovieCredits(movieID: Movie.ID) async -> [Credit.ID] {
        guard let languageCode else { return [] }
        do {
            credits = try await movieDatabaseAPIClient.fetchMovieCredits(movieID: movieID, language: languageCode)
            return creditIDs
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return []
        }
    }

    func fetchTVShowCredits(tvShowID: TVShow.ID) async -> [Credit.ID] {
        guard let languageCode else { return [] }
        do {
            credits = try await movieDatabaseAPIClient.fetchTVShowCredits(tvShowID: tvShowID, language: languageCode)
            return creditIDs
        } catch {
            await MainActor.run {
                onError?(error.localizedDescription)
            }
            return []
        }
    }

    func bind(onError: @escaping (String) -> Void) {
        self.onError = onError
    }
}
