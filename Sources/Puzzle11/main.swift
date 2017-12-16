import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
    let input = read(fileAt: filename)
    let directions = input
        .components(separatedBy: ",")
        .map({ HexGrid.Direction(rawValue: $0)! })
    let hexGrid = HexGrid()

	switch part {
	case .one:
        let destination = directions.reduce(.zero, { hexGrid.position($0, to: $1) })
        print(hexGrid.distance(from: .zero, to: destination))
	case .two:
        var positions: [HexGrid.Position] = []
        for direction in directions {
            let previousPosition = positions.last ?? .zero
            positions.append(hexGrid.position(previousPosition, to: direction))
        }
        print(positions.map({ hexGrid.distance(from: .zero, to: $0) }).max()!)
	}
}

main.run()
