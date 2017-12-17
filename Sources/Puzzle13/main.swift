import Foundation
import Commander
import Logic

let main = command(
    Argument<Part>("part", description: "The puzzle part (1 or 2)"),
    Argument<String>("input", description: "The path to the input file")
) { (part: Part, filename: String) in
    let firewall = Firewall()
    read(fileAt: filename)
        .components(separatedBy: "\n")
        .forEach({ line in
            let components = line.components(separatedBy: ": ")
            let depth = Int(components[0])!
            let range = Int(components[1])!
            firewall.addLayer(depth: depth, range: range)
        })

    switch part {
    case .one:
        print(firewall.simulateTripSeverity())
    case .two:
        print((0..<Int.max).first(where: { !firewall.willGetCaughtInTrip(delay: $0) })!)
    }
}

main.run()
