import Foundation
import Logic

guard CommandLine.arguments.count == 2 else {
	print("error: expect input path")
	exit(1)
}

let jumps = read(fileAt: CommandLine.arguments[1])
	.components(separatedBy: "\n")
	.map({ Int($0)! })
let interrupt = Interrupt(jumps: jumps, style: .simple)
interrupt.runUntilExit()
print(interrupt.numberOfCycles)