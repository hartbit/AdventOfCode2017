public struct Spreadsheet {
	private let values: [[Int]]

	public init(values: [[Int]]) {
		self.values = values
	}

	public func checksum(ofRowAt index: Int) -> Int {
		guard index < values.count else {
			fatalError("row index out of bounds")
		}
		
		let row = values[index]
		let max = row.max() ?? 0
		let min = row.min() ?? 0
		return max - min
	}

	public func checksum() -> Int {
		return values.indices.map(checksum(ofRowAt:)).reduce(0, +)
	}

	public func divisibleResult(ofRowAt index: Int) -> Int? {
		guard index < values.count else {
			fatalError("row index out of bounds")
		}
		
		let row = values[index].sorted(by: >)
		for (index1, value1) in row.enumerated() {
			for index2 in stride(from: index1 + 1, to: row.count, by: 1) {
				let value2 = row[index2]
				if value1 % value2 == 0 {
					return value1 / value2
				}
			}
		}

		return nil
	}

	public func sumOfDivisibleResults() -> Int {
		return values.indices.map({ divisibleResult(ofRowAt: $0) ?? 0 }).reduce(0, +)
	}
}