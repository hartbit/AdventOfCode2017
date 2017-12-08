import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let lines = read(fileAt: filename).components(separatedBy: "\n")
	let checker = PassphraseChecker()
	
	let output: Int
	switch part {
	case .one:
		output = lines.lazy.filter({ checker.isValid($0) }).count
	case .two:
		output = lines.lazy.filter({ checker.isValidWithAnagrams($0) }).count
	}

	print(output)
}

main.run()