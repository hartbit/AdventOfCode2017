import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
    let pipes = Pipes()
    read(fileAt: filename)
        .components(separatedBy: "\n")
        .forEach({ pipes.addProgram(withFormat: $0) })

	switch part {
	case .one:
        print(pipes.programs(accessibleFrom: 0).count)
	case .two:
        print(pipes.numberOfGroups)
	}
}

main.run()
