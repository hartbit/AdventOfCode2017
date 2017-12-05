import XCTest
@testable import Logic

class InterruptTests: XCTestCase {
	func testPuzzle1() {
		let interrupt = Interrupt(jumps: [0, 3, 0, 1, -3], style: .simple)
        XCTAssertEqual(interrupt.debugDescription, "(0) 3 0 1 -3")
        interrupt.step()
        XCTAssertEqual(interrupt.debugDescription, "(1) 3 0 1 -3")
        interrupt.step()
        XCTAssertEqual(interrupt.debugDescription, "2 (3) 0 1 -3")
        interrupt.step()
        XCTAssertEqual(interrupt.debugDescription, "2 4 0 1 (-3)")
        interrupt.step()
        XCTAssertEqual(interrupt.debugDescription, "2 (4) 0 1 -2")
        interrupt.step()
        XCTAssertEqual(interrupt.debugDescription, "2 5 0 1 -2")
	}

	func testPuzzle2() {
		let interrupt = Interrupt(jumps: [0, 3, 0, 1, -3], style: .complex)
        interrupt.run()
        XCTAssertEqual(interrupt.debugDescription, "2 3 2 3 -1")
	}

	static var allTests = {
        return [
            ("testPuzzle1", testPuzzle1),
            ("testPuzzle2", testPuzzle2),
        ]
    }()
}

extension Interrupt: CustomDebugStringConvertible {
    public var debugDescription: String {
        return jumps
            .enumerated()
            .map({ index, jump in index == programCounter ? "(\(jump))" : "\(jump)" })
            .joined(separator: " ")
    }
}