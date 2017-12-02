public struct Captcha {
	public init() {
	}

	public func sum(of sequence: String, offset: Int = 1) -> Int {
		let digits = sequence.map({ Int(String($0))! })

		var sum = 0
		for (index, digit) in digits.enumerated() {
			let nextIndex = (index + offset) % digits.count
			if digits[nextIndex] == digit {
				sum += digit
			}
		}

		return sum
	}
}