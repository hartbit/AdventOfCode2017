public class MemoryReallocator {
    public private(set) var banks: [Int]
    public private(set) var numberOfCycles: Int = 0

	public init(banks: [Int]) {
        self.banks = banks
	}

	public func runCycle() {
        let maxIndex = banks
            .enumerated()
            .max(by: { lhs, rhs in
                let (lhsIndex, lhsBlocks) = lhs
                let (rhsIndex, rhsBlocks) = rhs
                return lhsBlocks != rhsBlocks ? lhsBlocks < rhsBlocks : rhsIndex < lhsIndex
            })
            .map({ $0.0 })!

        var blocks = banks[maxIndex]
        banks[maxIndex] = 0

        var index = maxIndex
        while blocks > 0 {
            index = (index + 1) % banks.count
            banks[index] += 1
            blocks -= 1
        }

        numberOfCycles += 1
	}

    @discardableResult
	public func runUntilLoop() -> Int {
        var previousBanks: [String:Int] = [:]
        repeat {
            previousBanks[description] = numberOfCycles
            runCycle()
        } while !previousBanks.keys.contains(description)
        return numberOfCycles - previousBanks[description]!
    }
}
extension MemoryReallocator: CustomStringConvertible {
    public var description: String {
        return banks
            .map({ $0.description })
            .joined(separator: " ")
    }
}