import XCTest
@testable import Logic

class CaptchaTests: XCTestCase {
	func testPuzzle1() {
		let captcha = Captcha()
		XCTAssertEqual(captcha.sum(of: "1122"), 3)
		XCTAssertEqual(captcha.sum(of: "1111"), 4)
		XCTAssertEqual(captcha.sum(of: "1234"), 0)
		XCTAssertEqual(captcha.sum(of: "91212129"), 9)
	}

	func testPuzzle2() {
		let captcha = Captcha()
		XCTAssertEqual(captcha.sum(of: "1212", offset: 2), 6)
		XCTAssertEqual(captcha.sum(of: "1221", offset: 2), 0)
		XCTAssertEqual(captcha.sum(of: "123425", offset: 3), 4)
		XCTAssertEqual(captcha.sum(of: "123123", offset: 3), 12)
		XCTAssertEqual(captcha.sum(of: "12131415", offset: 4), 4)
	}

	static var allTests = {
        return [
            ("testPuzzle1", testPuzzle1),
            ("testPuzzle2", testPuzzle2),
        ]
    }()
}