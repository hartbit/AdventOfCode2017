import XCTest
@testable import Logic

class PipesTests: XCTestCase {
	func testPuzzle1() {
		let pipes = Pipes()
        pipes.addProgram(withFormat: "0 <-> 2")
        pipes.addProgram(withFormat: "1 <-> 1")
        pipes.addProgram(withFormat: "2 <-> 0, 3, 4")
        pipes.addProgram(withFormat: "3 <-> 2, 4")
        pipes.addProgram(withFormat: "4 <-> 2, 3, 6")
        pipes.addProgram(withFormat: "5 <-> 6")
        pipes.addProgram(withFormat: "6 <-> 4, 5")
        XCTAssertEqual(pipes.programs(accessibleFrom: 0), Set([0, 2, 3, 4, 5, 6]))
	}

	func testPuzzle2() {
		let pipes = Pipes()
        pipes.addProgram(withFormat: "0 <-> 2")
        pipes.addProgram(withFormat: "1 <-> 1")
        pipes.addProgram(withFormat: "2 <-> 0, 3, 4")
        pipes.addProgram(withFormat: "3 <-> 2, 4")
        pipes.addProgram(withFormat: "4 <-> 2, 3, 6")
        pipes.addProgram(withFormat: "5 <-> 6")
        pipes.addProgram(withFormat: "6 <-> 4, 5")
        XCTAssertEqual(pipes.numberOfGroups, 2)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}
