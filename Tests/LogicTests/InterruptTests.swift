import XCTest
@testable import Logic

class InterruptTests: XCTestCase {
	func testPuzzle1() {
		let interrupt = Interrupt(jumps: [0, 3, 0, 1, -3], style: .simple)
        XCTAssertEqual(interrupt.numberOfCycles, 0)
        XCTAssertEqual(interrupt.debugDescription, "(0) 3 0 1 -3")
        interrupt.step()
        XCTAssertEqual(interrupt.numberOfCycles, 1)
        XCTAssertEqual(interrupt.debugDescription, "(1) 3 0 1 -3")
        interrupt.step()
        XCTAssertEqual(interrupt.numberOfCycles, 2)
        XCTAssertEqual(interrupt.debugDescription, "2 (3) 0 1 -3")
        interrupt.step()
        XCTAssertEqual(interrupt.numberOfCycles, 3)
        XCTAssertEqual(interrupt.debugDescription, "2 4 0 1 (-3)")
        interrupt.step()
        XCTAssertEqual(interrupt.numberOfCycles, 4)
        XCTAssertEqual(interrupt.debugDescription, "2 (4) 0 1 -2")
        interrupt.step()
        XCTAssertEqual(interrupt.numberOfCycles, 5)
        XCTAssertEqual(interrupt.debugDescription, "2 5 0 1 -2")
	}

	func testPuzzle2() {
		let interrupt = Interrupt(jumps: [0, 3, 0, 1, -3], style: .complex)
        interrupt.runUntilExit()
        XCTAssertEqual(interrupt.numberOfCycles, 10)
        XCTAssertEqual(interrupt.debugDescription, "2 3 2 3 -1")
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}

extension Interrupt: CustomDebugStringConvertible {
    public var debugDescription: String {
        return jumps
            .enumerated()
            .map({ index, jump in index == programCounter ? "(\(jump))" : "\(jump)" })
            .joined(separator: " ")
    }
}