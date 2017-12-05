import XCTest
@testable import Logic

class PassphraseCheckerTests: XCTestCase {
	func testPuzzle1() {
		let checker = PassphraseChecker()
		XCTAssertEqual(checker.isValid("aa bb cc dd ee"), true)
		XCTAssertEqual(checker.isValid("aa bb cc dd aa"), false)
		XCTAssertEqual(checker.isValid("aa bb cc dd aaa"), true)
	}

	func testPuzzle2() {
		let checker = PassphraseChecker()
		XCTAssertEqual(checker.isValidWithAnagrams("abcde fghij"), true)
		XCTAssertEqual(checker.isValidWithAnagrams("abcde xyz ecdab"), false)
		XCTAssertEqual(checker.isValidWithAnagrams("a ab abc abd abf abj"), true)
        XCTAssertEqual(checker.isValidWithAnagrams("iiii oiii ooii oooi oooo"), true)
        XCTAssertEqual(checker.isValidWithAnagrams("oiii ioii iioi iiio"), false)
	}

	static var allTests = {
        return [
            ("testPuzzle1", testPuzzle1),
            ("testPuzzle2", testPuzzle2),
        ]
    }()
}