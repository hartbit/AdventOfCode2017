import Regex

private let regex = Regex("\\A(\\d+) <-> (\\d+(?:,\\s\\d+)*)\\z")

public class Pipes {
	private var programs: [Int: Set<Int>] = [:]

	public var numberOfGroups: Int {
		var numberOfGroups = 0
		var programsVisited: Set<Int> = []

		for (program, _) in programs where !programsVisited.contains(program) {
			let programsInGroup = programs(accessibleFrom: program)
			programsVisited.formUnion(programsInGroup)
			numberOfGroups += 1
		}

		return numberOfGroups
	}

	public init() {
	}

	public func addProgram(withFormat format: String) {
		guard let match = regex.firstMatch(in: format) else {
            fatalError("invalid format: \(format)")
        }

		let program = Int(match.captures[0]!)!
		let other = match.captures[1]!.components(separatedBy: ", ").map({ Int($0)! })
		addProgram(program, pipedTo: other)
	}

	public func addProgram(_ program: Int, pipedTo other: [Int]) {
		programs[program] = Set(other)
	}

	public func programs(accessibleFrom program: Int) ->  Set<Int> {
		var programsToVisit: [Int] = [program]
		var programsVisited: Set<Int> = []

		while !programsToVisit.isEmpty {
			let program = programsToVisit.removeFirst()
			programsVisited.insert(program)
			let nextProgramsToVisit = programs[program]!.subtracting(programsVisited)
			programsToVisit.append(contentsOf: nextProgramsToVisit)
		}

		return programsVisited
	}
}