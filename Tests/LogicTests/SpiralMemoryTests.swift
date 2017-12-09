import XCTest
@testable import Logic

class SpiralMemoryTests: XCTestCase {
	func testPuzzle1() {
		let memory = SpiralMemory()
		XCTAssertEqual(memory.distance(to: 1), 0)
		XCTAssertEqual(memory.distance(to: 12), 3)
		XCTAssertEqual(memory.distance(to: 23), 2)
		XCTAssertEqual(memory.distance(to: 1024), 31)
	}

	func testPuzzle2() {
		let memory = SpiralMemory()
		memory.stressTest(upTo: 806)
		XCTAssertEqual(memory[0, 0]!, 1)
		XCTAssertEqual(memory[1, 0]!, 1)
		XCTAssertEqual(memory[1, -1]!, 2)
		XCTAssertEqual(memory[0, -1]!, 4)
		XCTAssertEqual(memory[-1, -1]!, 5)
		XCTAssertEqual(memory[-1, 0]!, 10)
		XCTAssertEqual(memory[-1, 1]!, 11)
		XCTAssertEqual(memory[0, 1]!, 23)
		XCTAssertEqual(memory[1, 1]!, 25)
		XCTAssertEqual(memory[2, 1]!, 26)
		XCTAssertEqual(memory[2, 0]!, 54)
		XCTAssertEqual(memory[2, -1]!, 57)
		XCTAssertEqual(memory[2, -2]!, 59)
		XCTAssertEqual(memory[1, -2]!, 122)
		XCTAssertEqual(memory[0, -2]!, 133)
		XCTAssertEqual(memory[-1, -2]!, 142)
		XCTAssertEqual(memory[-2, -2]!, 147)
		XCTAssertEqual(memory[-2, -1]!, 304)
		XCTAssertEqual(memory[-2, 0]!, 330)
		XCTAssertEqual(memory[-2, 1]!, 351)
		XCTAssertEqual(memory[-2, 2]!, 362)
		XCTAssertEqual(memory[-1, 2]!, 747)
		XCTAssertEqual(memory[0, 2]!, 806)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}