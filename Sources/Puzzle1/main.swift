import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let input = read(fileAt: filename)
	let offset: Int = {
		switch part {
		case .one:
			return 1
		case .two:
			return input.count / 2
		}
	}()

	let captcha = Captcha()
	let output = captcha.sum(of: input, offset: offset)
	print(output)
}

main.run()