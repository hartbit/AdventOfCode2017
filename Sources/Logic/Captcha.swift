public struct Captcha {
	public init() {
	}

	public func sum(of sequence: String, offset: Int = 1) -> Int {
		let digits = sequence.map({ Int(String($0))! })
		return digits
			.indices
			.lazy
			.filter({ digits[$0] == digits[($0 + offset) % digits.count] })
			.map({ digits[$0] })
			.reduce(0, +)
	}
}