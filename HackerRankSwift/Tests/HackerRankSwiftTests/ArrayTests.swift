import XCTest
@testable import HackerRankSwift

final class ArrayTests: XCTestCase {
    func testLeftRotation() {
        let expected = [5, 1, 2, 3, 4]
        let actual = rotLeft(a: [1, 2, 3, 4, 5], d: 4)
        XCTAssertEqual(expected, actual)
    }

    func testMinimumSwaps() {
        let expected = 3
        let actual = minimumSwaps(arr: [1, 3, 5, 2, 4, 6, 7])
        XCTAssertEqual(expected, actual)

        // [1, 3, 5, 2, 4, 6, 7]
        // [1, 2, 5, 3, 4, 6, 7] - 1
        // [1, 2, 5, 3, 4, 6, 7] - 2
    }

//    static var allTests = [
//        ("testLeftRotation", testLeftRotation),
//    ]
}
