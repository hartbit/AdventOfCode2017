import Foundation
import Logic

guard CommandLine.arguments.count == 2 else {
	print("error: expect input path")
	exit(1)
}

let values = read(fileAt: CommandLine.arguments[1])
	.components(separatedBy: "\n")
	.map({ line in
		line.components(separatedBy: "\t").map({ Int($0)! })
	})
let spreadsheet = Spreadsheet(values: values)
let output = spreadsheet.sumOfDivisibleResults()
print(output)