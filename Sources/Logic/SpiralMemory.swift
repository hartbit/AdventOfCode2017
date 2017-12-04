import Foundation

public class SpiralMemory {
	struct Index: Hashable {
		static let zero = Index(x: 0, y:0)

		static func == (lhs: Index, rhs: Index) -> Bool {
			return lhs.x == rhs.x && lhs.y == rhs.y
		}

		let x: Int
		let y: Int

		init(x: Int, y: Int) {
			self.x = x
			self.y = y
		}

		var hashValue: Int {
			return x ^ y
		}

		var topLeftIndex: Index {
			return Index(x: x - 1, y: y - 1)
		}

		var topIndex: Index {
			return Index(x: x, y: y - 1)
		}

		var topRightIndex: Index {
			return Index(x: x + 1, y: y - 1)
		}

		var leftIndex: Index {
			return Index(x: x - 1, y: y)
		}

		var rightIndex: Index {
			return Index(x: x + 1, y: y)
		}

		var bottomLeftIndex: Index {
			return Index(x: x - 1, y: y + 1)
		}

		var bottomIndex: Index {
			return Index(x: x, y: y + 1)
		}

		var bottomRightIndex: Index {
			return Index(x: x + 1, y: y + 1)
		}
	}

	private var data: [Index: Int] = [:]

	public init() {
	}

	public subscript(x: Int, y: Int) -> Int? {
		return data[Index(x: x, y: y)]
	}

	public func distance(to index: Int) -> Int {
		let radius = Int(floor(ceil(sqrt(Double(index))) / 2))
		guard radius > 0 else {
			return 0
		}

		let maxRadiusValue = Int(pow(Double(2 * radius + 1), 2))
		let midPoints = [
			maxRadiusValue - radius,
			maxRadiusValue - 3 * radius,
			maxRadiusValue - 5 * radius,
			maxRadiusValue - 7 * radius,
		]

		let offset = midPoints.map({ abs($0 - index) }).min()!
		return radius + offset
	}

	@discardableResult
	public func stressTest(upTo threshold: Int) -> Int {
		var index: Index = .zero
		while true {
			var sum = 0

			let topData = data[index.topIndex]
			if let topData = topData { sum += topData }
			let topLeftData = data[index.topLeftIndex]
			if let topLeftData = topLeftData { sum += topLeftData }
			let topRightData = data[index.topRightIndex]
			if let topRightData = topRightData { sum += topRightData }
			let leftData = data[index.leftIndex]
			if let leftData = leftData { sum += leftData }
			let rightData = data[index.rightIndex]
			if let rightData = rightData { sum += rightData }
			let bottomData = data[index.bottomIndex]
			if let bottomData = bottomData { sum += bottomData }
			let bottomLeftData = data[index.bottomLeftIndex]
			if let bottomLeftData = bottomLeftData { sum += bottomLeftData }
			let bottomRightData = data[index.bottomRightIndex]
			if let bottomRightData = bottomRightData { sum += bottomRightData }

			if sum == 0 {
				sum = 1
			}

			data[index] = sum

			if sum >= threshold {
				return sum
			}

			if leftData != nil && topData == nil {
				index = index.topIndex
			} else if bottomData != nil && leftData == nil {
				index = index.leftIndex
			} else if rightData != nil && bottomData == nil {
				index = index.bottomIndex
			} else {
				index = index.rightIndex
			}
		}
	}
}