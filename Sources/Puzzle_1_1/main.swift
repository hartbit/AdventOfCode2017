import Foundation
import Logic

guard CommandLine.arguments.count == 2 else {
	print("error: expect input path")
	exit(1)
}

let captcha = Captcha()
let input = read(fileAt: CommandLine.arguments[1])
let output = captcha.sum(of: input)
print(output)