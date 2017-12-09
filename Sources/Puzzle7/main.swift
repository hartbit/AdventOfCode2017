import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let input = read(fileAt: filename)
	let tree = ProgramTree(format: input)

	switch part {
	case .one: print(tree.name)
	case .two: print(tree.findCorrectedWeight()!)
	}
}

main.run()