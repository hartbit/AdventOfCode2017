import Foundation

guard CommandLine.arguments.count == 2 else {
	print("error: expect input argument")
	exit(1)
}

let input = CommandLine.arguments[1]
let digits = input.map({ Int(String($0))! })

var sum = 0
let offset = digits.count / 2
for (index, digit) in digits.enumerated() {
	let nextIndex = (index + offset) % digits.count
	if digits[nextIndex] == digit {
		sum += digit
	}
}

print(sum)