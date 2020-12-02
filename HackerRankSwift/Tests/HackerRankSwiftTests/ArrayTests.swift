import XCTest
@testable import HackerRankSwift

final class ArrayTests: XCTestCase {

    override func setUp() {
        // 60 is the minimum...
        executionTimeAllowance = 60
        continueAfterFailure = true
    }

    func testLeftRotation() {
        let expected = [5, 1, 2, 3, 4]
        let actual = rotLeft(a: [1, 2, 3, 4, 5], d: 4)
        XCTAssertEqual(expected, actual)
    }

    func testMinimumSwaps() {
        let expected = 3
        let actual = minimumSwaps(arr: [1, 3, 5, 2, 4, 6, 7])
        XCTAssertEqual(expected, actual)
    }

    func testMinimumSwapsHugeInput() {
        let expected = 50000

        let input14 = Array(1...100000).reversed()
        let actual = minimumSwaps(arr: Array(input14))

        XCTAssertEqual(expected, actual)
    }
}
