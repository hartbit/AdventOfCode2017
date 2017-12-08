import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let values = read(fileAt: filename)
		.components(separatedBy: "\n")
		.map({ $0.components(separatedBy: "\t").map({ Int($0)! }) })

	let spreadsheet = Spreadsheet(values: values)

	let output: Int
	switch part {
	case .one:
		output = spreadsheet.checksum()
	case .two:
		output = spreadsheet.sumOfDivisibleResults()
	}

	print(output)
}

main.run()