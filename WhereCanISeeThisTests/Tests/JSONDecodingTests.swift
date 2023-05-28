import XCTest
@testable import WhereCanISeeThis

final class JSONDecodingTests: XCTestCase {
    var decoder: JSONDecoder!

    override func setUpWithError() throws {
        try super.setUpWithError()
        decoder = JSONDecoder.movieDatabaseDecoder
    }

    override func tearDownWithError() throws {
        decoder = nil
        try super.tearDownWithError()
    }

    func test_유효한_movie_page_데이터를_올바르게_디코딩하는지() {
        // given
        let data = moviePageData

        // when
        do {
            let result = try decoder.decode(Page<Movie>.self, from: data)

            // then
            XCTAssertEqual(result.page, 1)
            XCTAssertEqual(result.results[0].id, 10195)
            XCTAssertEqual(result.totalPages, 14)
            XCTAssertEqual(result.totalResults, 264)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_유효한_tvShow_page_데이터를_올바르게_디코딩하는지() {
        // given
        let data = tvShowPageData

        // when
        do {
            let result = try decoder.decode(Page<TVShow>.self, from: data)

            // then
            XCTAssertEqual(result.page, 1)
            XCTAssertEqual(result.results[0].id, 203857)
            XCTAssertEqual(result.totalPages, 1)
            XCTAssertEqual(result.totalResults, 14)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_유효한_genreList_데이터를_올바르게_디코딩하는지() {
        // given
        let data = genreListData

        // when
        do {
            let result = try decoder.decode(GenreList.self, from: data)

            // then
            XCTAssertEqual(result.genres[0].id, 28)
            XCTAssertEqual(result.genres[0].name, "액션")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_유효한_watchProviderResult_데이터를_올바르게_디코딩하는지() {
        // given
        let data = watchProviderResultData

        // when
        do {
            let result = try decoder.decode(WatchProviderResult.self, from: data)

            // then
            XCTAssertEqual(result.id, 10195)
            XCTAssertEqual(result.results!["AD"]!.results[WatchProviderType.flatrate]![0].id, 337)
            XCTAssertEqual(result.results!["AE"]!.results[WatchProviderType.buy]![0].id, 2)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
