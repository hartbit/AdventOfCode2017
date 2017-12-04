import Foundation
import Logic

guard CommandLine.arguments.count == 2 else {
	print("error: expect input path")
	exit(1)
}

let input = Int(read(fileAt: CommandLine.arguments[1]))!
let memory = SpiralMemory()
let output = memory.distance(to: input)
print(output)