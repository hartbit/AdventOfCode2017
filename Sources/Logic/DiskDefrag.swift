public class DiskDefrag {
	private let grid: [Bool]

	public init(hash: String) {
		var grid: [Bool] = []
		for row in 0..<128 {
            let data = KnotHasher.hash("\(hash)-\(row)")
			for byte in data {
                let binary = String(byte, radix: 2)

                for _ in 0..<(8 - binary.count) {
                    grid.append(false)
                }

				for bit in binary {
					grid.append(bit == "1")
				}
			}
		}
		self.grid = grid
	}

	public var numberOfUsedBits: Int {
		return grid.reduce(0, { $0 + ($1 ? 1 : 0) })
	}

	public var numberOfUsedGroups: Int {
		var groups: [Set<Int>] = []
		for (index, isUsed) in grid.enumerated() {
            guard isUsed else { continue }
				
			let topIndex = index - 128
			let isTopUsed = topIndex >= 0 && grid[topIndex]
			let topGroupIndex = isTopUsed ? groups.index(where: { $0.contains(topIndex) }) : nil
			let leftIndex = index - 1
			let isLeftUsed = index % 128 != 0 && grid[leftIndex]
			let leftGroupIndex = isLeftUsed ? groups.index(where: { $0.contains(leftIndex) }) : nil

			if let topGroupIndex = topGroupIndex, !isLeftUsed {
				groups[topGroupIndex].insert(index)
			} else if let leftGroupIndex = leftGroupIndex, !isTopUsed {
				groups[leftGroupIndex].insert(index)
			} else if let topGroupIndex = topGroupIndex, let leftGroupIndex = leftGroupIndex {
				groups[leftGroupIndex].insert(index)

                if topGroupIndex != leftGroupIndex {
                    groups[leftGroupIndex].formUnion(groups[topGroupIndex])
                    groups.remove(at: topGroupIndex)
                }
			} else {
				groups.append([index])
			}
		}

		return groups.count
	}

	private subscript(row: Int, column: Int) -> Bool {
		return grid[row * 128 + column]
	}
}

extension DiskDefrag: CustomStringConvertible {
	public var description: String {
		return (0..<128).map({ row in
			var rowOutput = ""
            for column in 0..<128 {
                rowOutput.append(self[row, column] ? "#" : ".")
            }
			return rowOutput
        }).joined(separator: "\n")
	}
}
