import Regex

private let regex = Regex("(\\w+)\\s+((?:inc)|(?:dec))\\s+(-?\\d+)\\s+if\\s+(\\w+)\\s+((?:<)|(?:<=)|(?:>)|(?:>=)|(?:==)|(?:!=))\\s+(-?\\d+)")

public class Processor {
    public private(set) var registers: [String: Int] = [:]

    public init() {
    }

    public func execute(_ instruction: String) {
        guard let match = regex.firstMatch(in: instruction) else {
            fatalError("invalid instruction: \(instruction)")
        }

        let comparisonRegister = match.captures[3]!
        let comparator = Comparator(rawValue: match.captures[4]!)!
        let comparisonNumber = Int(match.captures[5]!)!

        guard comparator.compare(self[comparisonRegister], comparisonNumber) else {
            return
        }

        let operationRegister = match.captures[0]!
        let op = Operator(rawValue: match.captures[1]!)!
        let operatorNumber = Int(match.captures[2]!)!

        self[operationRegister] = op.operate(self[operationRegister], operatorNumber)
    }

    private subscript(register: String) -> Int {
        get { return registers[register] ?? 0 }
        set { registers[register] = newValue }
    }
}

private enum Operator: String {
    case increase = "inc"
    case decrease = "dec"

    func operate(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .increase: return lhs + rhs
        case .decrease: return lhs - rhs
        }
    }
}

private enum Comparator: String {
    case lessThan = "<"
    case lessThanOrEqual = "<="
    case greaterThan = ">"
    case greaterThanOrEqual = ">="
    case equal = "=="
    case notEqual = "!="

    func compare(_ lhs: Int, _ rhs: Int) -> Bool {
        switch self {
        case .lessThan: return lhs < rhs
        case .lessThanOrEqual: return lhs <= rhs
        case .greaterThan: return lhs > rhs
        case .greaterThanOrEqual: return lhs >= rhs
        case .equal: return lhs == rhs
        case .notEqual: return lhs != rhs
        }
    }
}
