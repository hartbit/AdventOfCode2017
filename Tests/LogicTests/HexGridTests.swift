import XCTest
@testable import Logic

class HexGridTests: XCTestCase {
	func testPuzzle1() {
		XCTAssertEqual(distance(after: [.ne, .ne, .ne]), 3)
		XCTAssertEqual(distance(after: [.ne, .ne, .sw, .sw]), 0)
		XCTAssertEqual(distance(after: [.ne, .ne, .s, .s]), 2)
		XCTAssertEqual(distance(after: [.se, .sw, .se, .sw, .sw]), 3)
	}

	private func distance(after directions: [HexGrid.Direction]) -> Int {
		let hexGrid = HexGrid()
		let childPosition: HexGrid.Position = directions.reduce(.zero, { hexGrid.position($0, to: $1) })
		return hexGrid.distance(from: .zero, to: childPosition)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
    ]
}