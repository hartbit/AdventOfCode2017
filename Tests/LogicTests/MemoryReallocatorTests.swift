import XCTest
@testable import Logic

class MemoryReallocatorTests: XCTestCase {
	func testPuzzle1() {
		var reallocator = MemoryReallocator(banks: [0, 2, 7, 0])
        XCTAssertEqual(reallocator.numberOfCycles, 0)
        XCTAssertEqual(reallocator.description, "0 2 7 0")
        reallocator.runCycle()
        XCTAssertEqual(reallocator.numberOfCycles, 1)
        XCTAssertEqual(reallocator.description, "2 4 1 2")
        reallocator.runCycle()
        XCTAssertEqual(reallocator.numberOfCycles, 2)
        XCTAssertEqual(reallocator.description, "3 1 2 3")
        reallocator.runCycle()
        XCTAssertEqual(reallocator.numberOfCycles, 3)
        XCTAssertEqual(reallocator.description, "0 2 3 4")
        reallocator.runCycle()
        XCTAssertEqual(reallocator.numberOfCycles, 4)
        XCTAssertEqual(reallocator.description, "1 3 4 1")
        reallocator.runCycle()
        XCTAssertEqual(reallocator.numberOfCycles, 5)
        XCTAssertEqual(reallocator.description, "2 4 1 2")

        reallocator = MemoryReallocator(banks: [0, 2, 7, 0])
        reallocator.runUntilLoop()
        XCTAssertEqual(reallocator.numberOfCycles, 5)
        XCTAssertEqual(reallocator.description, "2 4 1 2")
	}

	func testPuzzle2() {
        let reallocator = MemoryReallocator(banks: [0, 2, 7, 0])
        XCTAssertEqual(reallocator.runUntilLoop(), 4)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}