import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
    let input = read(fileAt: filename)

	switch part {
	case .one:
        let hasher = KnotHasher()
        input
            .components(separatedBy: ",")
            .map({ UInt8($0)! })
            .forEach({ hasher.reverse(by: $0) })
        print(Int(hasher.data[0]) * Int(hasher.data[1]))
	case .two:
        print(KnotHasher.hash(input).hexEncodedString())
	}
}

main.run()
