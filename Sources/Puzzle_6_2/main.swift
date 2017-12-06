import Foundation
import Logic

guard CommandLine.arguments.count == 2 else {
	print("error: expect input path")
	exit(1)
}

let banks = read(fileAt: CommandLine.arguments[1])
	.components(separatedBy: "\t")
	.map({ Int($0)! })
let reallocator = MemoryReallocator(banks: banks)
let output = reallocator.runUntilLoop()
print(output)