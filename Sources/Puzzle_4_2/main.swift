import Foundation
import Logic

guard CommandLine.arguments.count == 2 else {
	print("error: expect input path")
	exit(1)
}

let lines = read(fileAt: CommandLine.arguments[1]).components(separatedBy: "\n")
let checker = PassphraseChecker()
let output = lines.lazy.filter({ checker.isValidWithAnagrams($0) }).count
print(output)