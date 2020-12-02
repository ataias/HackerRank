import XCTest
@testable import HackerRankSwift

final class HackerRankSwiftTests: XCTestCase {
    func testLeftRotation() {
        XCTAssertEqual(rotLeft(a: [1, 2, 3, 4, 5], d: 4), [5, 1, 2, 3, 4])
    }

//    static var allTests = [
//        ("testLeftRotation", testLeftRotation),
//    ]
}
