import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let banks = read(fileAt: filename)
		.components(separatedBy: "\t")
		.map({ Int($0)! })
	let reallocator = MemoryReallocator(banks: banks)
	let output = reallocator.runUntilLoop()

	switch part {
	case .one: print(reallocator.numberOfCycles)
	case .two: print(output)
	}
}

main.run()