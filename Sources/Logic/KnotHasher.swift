import Foundation

public class KnotHasher {
	public private(set) var data: Data
	public private(set) var position: Int = 0
	public private(set) var skipSize: Int = 0

	public init(size: Int = 256) {
		assert(size <= 256)
		data = Data(0...UInt8(size - 1))
	}

	public func reverse(by length: UInt8) {
		let firstSliceEndIndex = min(position + Int(length), data.count)
		let firstSliceRange = position..<firstSliceEndIndex
		let secondSliceEndIndex = Int(length) - firstSliceRange.count
		let secondSliceRange = ..<secondSliceEndIndex
		let selection = data[firstSliceRange] + data[secondSliceRange]
		let selectionReversed = Array(selection.reversed())
        data.replaceSubrange(firstSliceRange, with: selectionReversed[..<firstSliceRange.count])
        data.replaceSubrange(secondSliceRange, with: selectionReversed[firstSliceRange.count...])
		position = (position + Int(length) + skipSize) % data.count
		skipSize += 1
	}
	
	public static func hash(_ input: String) -> String {
		var lengths = input.data(using: .utf8)!
		lengths.append(Data([17, 31, 73, 47, 23]))

		let hasher = KnotHasher()
		for _ in 0..<64 {
			for length in lengths {
				hasher.reverse(by: length)
			}
		}

		var hash = Data()
		for i in stride(from: 0, to: 256, by: 16) {
			let sum = hasher.data[i..<(i + 16)].reduce(0, { $0 ^ $1 })
			hash.append(sum)
		}

		return hash.hexEncodedString()
	}
}

extension Data {
	func hexEncodedString() -> String {
		var hex = ""
		for byte in self {
			hex += String(format: "%02x", byte)
		}
		return hex
	}
}
