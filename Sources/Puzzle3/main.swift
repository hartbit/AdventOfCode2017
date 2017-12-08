import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let input = Int(read(fileAt: filename))!
	let memory = SpiralMemory()

	let output: Int
	switch part {
	case .one:
		output = memory.distance(to: input)
	case .two:
		output = memory.stressTest(upTo: input)
	}

	print(output)
}

main.run()