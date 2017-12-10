import XCTest
@testable import Logic

class StreamParserTests: XCTestCase {
	func testPuzzle1() {
		let parser = StreamParser()
		XCTAssertEqual(parser.parse("<>"), .garbage(""))
		XCTAssertEqual(parser.parse("<random characters>"), .garbage("random characters"))
		XCTAssertEqual(parser.parse("<<<<>"), .garbage("<<<"))
		XCTAssertEqual(parser.parse("<{!>}>"), .garbage("{}"))
		XCTAssertEqual(parser.parse("<!!>"), .garbage(""))
		XCTAssertEqual(parser.parse("<!!!>>"), .garbage(""))
		XCTAssertEqual(parser.parse("<{o\"i!a,<{i<a>"), .garbage("{o\"i,<{i<a"))
		
        var group = parser.parse("{}")
        XCTAssertEqual(group, .group([]))
		XCTAssertEqual(group.score, 1)

        group = parser.parse("{{{}}}")
        XCTAssertEqual(group.score, 6)
        XCTAssertEqual(group, .group([
            .group([
                .group([])
            ])
        ]))

        group = parser.parse("{{},{}}")
        XCTAssertEqual(group.score, 5)
        XCTAssertEqual(group, .group([
            .group([]),
            .group([])
        ]))

        group = parser.parse("{{{},{},{{}}}}")
        XCTAssertEqual(group.score, 16)
        XCTAssertEqual(group, .group([
            .group([
                .group([]),
                .group([]),
                .group([
                    .group([])
                ])
            ])
        ]))

        group = parser.parse("{<{},{},{{}}>}")
        XCTAssertEqual(group, .group([.garbage("{},{},{{}}")]))

        group = parser.parse("{<a>,<a>,<a>,<a>}")
        XCTAssertEqual(group.score, 1)
        XCTAssertEqual(group, .group([
            .garbage("a"),
            .garbage("a"),
            .garbage("a"),
            .garbage("a")
        ]))

        group = parser.parse("{{<a>},{<a>},{<a>},{<a>}}")
        XCTAssertEqual(group.score, 9)
        XCTAssertEqual(group, .group([
            .group([.garbage("a")]),
            .group([.garbage("a")]),
            .group([.garbage("a")]),
            .group([.garbage("a")])
        ]))

        group = parser.parse("{{<!>},{<!>},{<!>},{<a>}}")
        XCTAssertEqual(group.score, 3)
        XCTAssertEqual(group, .group([
            .group([
                .garbage("},{<},{<},{<a")
            ])
        ]))
	}

	func testPuzzle2() {
		let parser = StreamParser()
		XCTAssertEqual(parser.parse("<>").garbageCount, 0)
		XCTAssertEqual(parser.parse("<random characters>").garbageCount, 17)
		XCTAssertEqual(parser.parse("<<<<>").garbageCount, 3)
		XCTAssertEqual(parser.parse("<{!>}>").garbageCount, 2)
		XCTAssertEqual(parser.parse("<!!>").garbageCount, 0)
		XCTAssertEqual(parser.parse("<!!!>>").garbageCount, 0)
		XCTAssertEqual(parser.parse("<{o\"i!a,<{i<a>").garbageCount, 10)
	}

	static let allTests = [
        ("testPuzzle1", testPuzzle1),
        ("testPuzzle2", testPuzzle2),
    ]
}
