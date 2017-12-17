import XCTest
@testable import Logic

class KnotHasherTests: XCTestCase {
	func testPuzzle1() {
		let hasher = KnotHasher(size: 5)
		XCTAssertEqual(hasher.debugDescription, "[0] 1 2 3 4")
		hasher.reverse(by: 3)
		XCTAssertEqual(hasher.debugDescription, "2 1 0 [3] 4")
		hasher.reverse(by: 4)
		XCTAssertEqual(hasher.debugDescription, "4 3 0 [1] 2")
		hasher.reverse(by: 1)
		XCTAssertEqual(hasher.debugDescription, "4 [3] 0 1 2")
		hasher.reverse(by: 5)
		XCTAssertEqual(hasher.debugDescription, "3 4 2 1 [0]")
	}

	func testPuzzle2() {
		XCTAssertEqual(KnotHasher.hash("").hexEncodedString(), "a2582a3a0e66e6e86e3812dcb672a272")
		XCTAssertEqual(KnotHasher.hash("AoC 2017").hexEncodedString(), "33efeb34ea91902bb2f59c9920caa6cd")
		XCTAssertEqual(KnotHasher.hash("1,2,3").hexEncodedString(), "3efbe78a8d82f29979031a4aa0b16a9d")
		XCTAssertEqual(KnotHasher.hash("1,2,4").hexEncodedString(), "63960835bcdc130f0b66d7ff4f6a5a8e")
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}

extension KnotHasher: CustomDebugStringConvertible {
	public var debugDescription: String {
		return data
			.enumerated()
			.map({ (index, element) in index == position ? "[\(element)]" : "\(element)" })
			.joined(separator: " ")
	}
}
