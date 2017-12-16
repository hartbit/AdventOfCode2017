public class HexGrid {
	public struct Position {
		public let x: Int
		public let y: Int
		
		public static let zero = Position(x: 0, y: 0)
	}

	public enum Direction: String {
		case n, s, nw, sw, ne, se
	}

	public init() {
	}

	public func position(_ position: Position, to direction: Direction) -> Position {
		switch direction {
		case .n: return Position(x: position.x, y: position.y + 1)
		case .s: return Position(x: position.x, y: position.y - 1)
		case .nw: return Position(x: position.x - 1, y: position.y + 1)
		case .ne: return Position(x: position.x + 1, y: position.y)
		case .sw: return Position(x: position.x - 1, y: position.y)
		case .se: return Position(x: position.x + 1, y: position.y - 1)
		}
	}

	public func distance(from: Position, to: Position) -> Int {
		guard from == .zero else {
			return distance(from: .zero, to: Position(x: to.x - from.x, y: to.y - from.y))
		}

		if (to.x >= 0 && to.y >= 0) || (to.x <= 0 && to.y <= 0) {
			return abs(to.x) + abs(to.y)
		} else {
			return abs(to.y) + abs(abs(to.y) - abs(to.x))
		}
	}
}

extension HexGrid.Position: Equatable {
	public static func == (lhs: HexGrid.Position, rhs: HexGrid.Position) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}

	public var hashValue: Int {
		return x ^ y
	}
}