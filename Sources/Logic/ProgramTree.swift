import Regex

private let regex = Regex("\\A(\\w+) \\((\\d+)\\)(?: -> (\\w+(?:,\\s\\w+)*))?\\z")

public class ProgramTree {
    public let name: String
    public let weight: Int
    public let children: [ProgramTree]
    
    public lazy var totalWeight: Int = {
        return weight + children.reduce(0, { $0 + $1.totalWeight })
    }()

    public convenience init(format: String) {
        typealias Line = (name: String, weight: Int, children: [String])

        var lines: [Line] = format
            .components(separatedBy: "\n")
            .map({ line in
                guard let match = regex.firstMatch(in: line) else {
                    fatalError("invalid line: \(line)")
                }

                let name = match.captures[0]!
                let weight = Int(match.captures[1]!)!
                let children = match.captures[2].map({ $0.components(separatedBy: ", ") }) ?? []
                return Line(name: name, weight: weight, children: children)
            })

        var programs: [String: ProgramTree] = [:]

        var index = 0
        while lines.count > 1 {
            let line = lines[index]
            let children = line.children.flatMap({ programs[$0] })
            if children.count == line.children.count {
                programs[line.name] = ProgramTree(
                    name: line.name,
                    weight: line.weight,
                    children: children)
                lines.remove(at: index)
            } else {
                index = index + 1
            }

            index = index % lines.count
        }
        
        let rootLine = lines[0]
        let rootChildren = rootLine.children.flatMap({ programs[$0] })
        assert(rootChildren.count == rootLine.children.count)
        self.init(
            name: rootLine.name,
            weight: rootLine.weight,
            children: rootChildren)
    }

    public init(name: String, weight: Int, children: [ProgramTree]) {
        self.name = name
        self.weight = weight
        self.children = children
    }

    public func findCorrectedWeight() -> Int? {
        let childrenByTotalWeight: [Int:[ProgramTree]] = Dictionary(grouping: children, by: { $0.totalWeight })
        guard childrenByTotalWeight.count == 2 else {
            if childrenByTotalWeight.count == 1 {
                return nil
            } else {
                fatalError("tree requires more than one correction")
            }
        }

        guard let invalidTotalWeight = childrenByTotalWeight.keys.first(where: {
            childrenByTotalWeight[$0]!.count == 1
        }) else {
            fatalError("tree requires more than one correction")
        }

        let invalidTree = childrenByTotalWeight[invalidTotalWeight]![0]
        if let correctedWeight = invalidTree.findCorrectedWeight() {
            return correctedWeight
        } else {
            let validTotalWeight = childrenByTotalWeight.keys.first(where: { $0 != invalidTotalWeight })!
            return invalidTree.weight + validTotalWeight - invalidTotalWeight
        }
    }
}
