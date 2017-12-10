import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
	let instructions = read(fileAt: filename).components(separatedBy: "\n")
    let processor = Processor()

	switch part {
	case .one:
        for instruction in instructions {
            processor.execute(instruction)
        }

        let maxRegisterValue = processor.registers.max(by: { $0.value < $1.value })!.value
        print(maxRegisterValue)
	case .two:
        var maxEverRegisterValue = 0
        for instruction in instructions {
            processor.execute(instruction)
            
            if let maxRegisterValue = processor.registers.max(by: { $0.value < $1.value })?.value {
                maxEverRegisterValue = max(maxEverRegisterValue, maxRegisterValue)
            }
        }

        print(maxEverRegisterValue)
	}
}

main.run()