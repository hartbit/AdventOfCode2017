import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
    let hash = read(fileAt: filename)
    let diskDefrag = DiskDefrag(hash: hash)

    switch part {
    case .one:
        print(diskDefrag.numberOfUsedBits)
    case .two:
        print(diskDefrag.numberOfUsedGroups)
    }
}

main.run()
