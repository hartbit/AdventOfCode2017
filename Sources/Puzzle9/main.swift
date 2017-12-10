import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
    let parser = StreamParser()
    let input = read(fileAt: filename)
    let element = parser.parse(input)

	switch part {
	case .one:
        print(element.score)
	case .two:
        print(element.garbageCount)
	}
}

main.run()