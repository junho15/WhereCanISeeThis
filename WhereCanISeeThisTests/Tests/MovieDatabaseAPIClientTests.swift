import XCTest
@testable import WhereCanISeeThis

final class MovieDatabaseAPIClientTests: XCTestCase {
    var sut: MovieDatabaseAPIClient!
    var session: MockURLSession!

    override func setUpWithError() throws {
        try super.setUpWithError()
        session = MockURLSession()
        sut = MovieDatabaseAPIClient(session: session)
    }

    override func tearDownWithError() throws {
        sut = nil
        session = nil
        try super.tearDownWithError()
    }
}

// MARK: - searchMovies

extension MovieDatabaseAPIClientTests {
    func test_searchMovies호출시_올바른_결과를_받는지() async {
        // given
        session.data = moviePageData
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let query = ""

        // when
        do {
            let result = try await sut.searchMovies(query: query)

            // then
            XCTAssertEqual(result.page, 1)
            XCTAssertEqual(result.totalResults, 264)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_searchMovies호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let query = ""

        // when
        do {
            _ = try await sut.searchMovies(query: query)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}

// MARK: - searchTVShows

extension MovieDatabaseAPIClientTests {
    func test_searchTvShows호출시_올바른_결과를_받는지() async {
        // given
        session.data = tvShowPageData
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let query = ""

        // when
        do {
            let result = try await sut.searchTVShows(query: query)

            // then
            XCTAssertEqual(result.page, 1)
            XCTAssertEqual(result.totalResults, 14)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_searchTVShows호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let query = ""

        // when
        do {
            _ = try await sut.searchTVShows(query: query)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}

// MARK: - fetchMovieWatchProviders

extension MovieDatabaseAPIClientTests {
    func test_fetchMovieWatchProviders호출시_올바른_결과를_받는지() async {
        // given
        session.data = watchProviderResultData
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let movieID = 10195

        // when
        do {
            let result = try await sut.fetchMovieWatchProviders(movieID: movieID)

            // then
            XCTAssertEqual(result.id, 10195)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_fetchMovieWatchProviders호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let movieID = 10195

        // when
        do {
            _ = try await sut.fetchMovieWatchProviders(movieID: movieID)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}

// MARK: - fetchTVShowWatchProviders

extension MovieDatabaseAPIClientTests {
    func test_fetchTVShowWatchProviders호출시_올바른_결과를_받는지() async {
        // given
        session.data = watchProviderResultData
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let tvShowID = 10195

        // when
        do {
            let result = try await sut.fetchTVShowWatchProviders(tvShowID: tvShowID)

            // then
            XCTAssertEqual(result.id, 10195)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_fetchTVShowWatchProviders호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let tvShowID = 10195

        // when
        do {
            _ = try await sut.fetchTVShowWatchProviders(tvShowID: tvShowID)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}

// MARK: - fetchMovieGenresList

extension MovieDatabaseAPIClientTests {
    func test_fetchMovieGenresList호출시_올바른_결과를_받는지() async {
        // given
        session.data = genreListData
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let language = "ko"

        // when
        do {
            let result = try await sut.fetchMovieGenresList(language: language)

            // then
            XCTAssertEqual(result.genres[0].id, 28)
            XCTAssertEqual(result.genres[0].name, "액션")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_fetchMovieGenresList호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let language = "ko"

        // when
        do {
            _ = try await sut.fetchMovieGenresList(language: language)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}

// MARK: - fetchTVShowGenresList

extension MovieDatabaseAPIClientTests {
    func test_fetchTVShowGenresList호출시_올바른_결과를_받는지() async {
        // given
        session.data = genreListData
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let language = "ko"

        // when
        do {
            let result = try await sut.fetchTVShowGenresList(language: language)

            // then
            XCTAssertEqual(result.genres[0].id, 28)
            XCTAssertEqual(result.genres[0].name, "액션")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_fetchTVShowGenresList호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let language = "ko"

        // when
        do {
            _ = try await sut.fetchTVShowGenresList(language: language)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}

// MARK: - fetchImage

extension MovieDatabaseAPIClientTests {
    func test_fetchImage호출시_올바른_결과를_받는지() async {
        // given
        session.data = UIImage.add.jpegData(compressionQuality: 1.0)!
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        let imagePath = "\test"

        // when
        do {
            let result = try await sut.fetchImage(imageSize: .original, imagePath: imagePath)

            // then
            XCTAssertNotNil(result)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_fetchImage호출시_서버에서_404코드를_보내면_badStatus에러를_반환하는지() async {
        // given
        session.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )
        let imagePath = "\test"

        // when
        do {
            _ = try await sut.fetchImage(imageSize: .original, imagePath: imagePath)
            XCTFail("Should return WhereCanISeeThisError.badStatus")
        } catch {
            if let error = error as? WhereCanISeeThisError,
               case .badStatus = error {
                // then
                XCTAssert(true)
            } else {
                XCTFail("Should return WhereCanISeeThisError.badStatus")
            }
        }
    }
}
