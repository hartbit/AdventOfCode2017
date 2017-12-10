import XCTest
@testable import Logic

class ProcessorTests: XCTestCase {
	func testPuzzle1() {
		let processor = Processor()
        XCTAssertEqual(processor.registers, [:])
        processor.execute("b inc 5 if a > 1")
        XCTAssertEqual(processor.registers, [:])
		processor.execute("a inc 1 if b < 5")
        XCTAssertEqual(processor.registers, ["a": 1])
        processor.execute("c dec -10 if a >= 1")
        XCTAssertEqual(processor.registers, ["a": 1, "c": 10])
        processor.execute("c inc -20 if c == 10")
        XCTAssertEqual(processor.registers, ["a": 1, "c": -10])
	}

	func testPuzzle2() {
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}