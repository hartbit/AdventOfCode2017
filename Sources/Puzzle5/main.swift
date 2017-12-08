import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let jumps = read(fileAt: filename)
		.components(separatedBy: "\n")
		.map({ Int($0)! })
	
	let style: Interrupt.Style = {
		switch part {
		case .one: return .simple
		case .two: return .complex
		}
	}()

	let interrupt = Interrupt(jumps: jumps, style: style)
	interrupt.runUntilExit()
	print(interrupt.numberOfCycles)
}

main.run()