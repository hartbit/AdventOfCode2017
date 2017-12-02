import XCTest
import Logic

class SpreadsheetTests: XCTestCase {
	func testPuzzle1() {
		let spreadsheet = Spreadsheet(values: [
			[5, 1, 9, 5],
			[7, 5, 3],
			[2, 4, 6, 8]
		])

		XCTAssertEqual(spreadsheet.checksum(ofRowAt: 0), 8)
		XCTAssertEqual(spreadsheet.checksum(ofRowAt: 1), 4)
		XCTAssertEqual(spreadsheet.checksum(ofRowAt: 2), 6)
		XCTAssertEqual(spreadsheet.checksum(), 18)
	}

	func testPuzzle2() {
		let spreadsheet = Spreadsheet(values: [
			[5, 9, 2, 8],
			[9, 4, 7, 3],
			[3, 8, 6, 5]
		])

		XCTAssertEqual(spreadsheet.divisibleResult(ofRowAt: 0), 4)
		XCTAssertEqual(spreadsheet.divisibleResult(ofRowAt: 1), 3)
		XCTAssertEqual(spreadsheet.divisibleResult(ofRowAt: 2), 2)
		XCTAssertEqual(spreadsheet.sumOfDivisibleResults(), 9)
	}

	static var allTests = {
        return [
            ("testPuzzle1", testPuzzle1),
            ("testPuzzle2", testPuzzle2),
        ]
    }()
}