import XCTest
@testable import Logic

class FirewallTests: XCTestCase {
	func testPuzzle1() {
		let firewall = Firewall()
		firewall.addLayer(depth: 0, range: 3)
		firewall.addLayer(depth: 1, range: 2)
		firewall.addLayer(depth: 4, range: 4)
		firewall.addLayer(depth: 6, range: 4)
		XCTAssertEqual(firewall.simulateTripSeverity(), 24)
	}

	func testPuzzle2() {
		let firewall = Firewall()
		firewall.addLayer(depth: 0, range: 3)
		firewall.addLayer(depth: 1, range: 2)
		firewall.addLayer(depth: 4, range: 4)
		firewall.addLayer(depth: 6, range: 4)

		for delay in 0...9 {
			XCTAssertEqual(firewall.willGetCaughtInTrip(delay: delay), true)
		}

		XCTAssertEqual(firewall.willGetCaughtInTrip(delay: 10), false)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}