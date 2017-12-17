import XCTest
@testable import Logic

class DiskDefragTests: XCTestCase {
	func testPuzzle1() {
		let diskDefrag = DiskDefrag(hash: "flqrgnkx")
		let lines = diskDefrag.description.components(separatedBy: "\n")
		XCTAssert(lines[0].starts(with: "##.#.#.."))
		XCTAssert(lines[1].starts(with: ".#.#.#.#"))
		XCTAssert(lines[2].starts(with: "....#.#."))
		XCTAssert(lines[3].starts(with: "#.#.##.#"))
		XCTAssert(lines[4].starts(with: ".##.#..."))
		XCTAssert(lines[5].starts(with: "##..#..#"))
		XCTAssert(lines[6].starts(with: ".#...#.."))
		XCTAssert(lines[7].starts(with: "##.#.##."))
        XCTAssertEqual(diskDefrag.numberOfUsedBits, 8108)
	}

	func testPuzzle2() {
		let diskDefrag = DiskDefrag(hash: "flqrgnkx")
        XCTAssertEqual(diskDefrag.numberOfUsedGroups, 1242)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}
