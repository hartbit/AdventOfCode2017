public struct PassphraseChecker {
	public init() {
	}

	public func isValid(_ passphrase: String) -> Bool {
		let words = passphrase.components(separatedBy: " ")
        return Set(words).count == words.count
	}

	public func isValidWithAnagrams(_ passphrase: String) -> Bool {
		let characterCounters = passphrase
			.components(separatedBy: " ")
			.map(CharacterCounter.init(string:))
        return Set(characterCounters).count == characterCounters.count
	}
}

private struct CharacterCounter: Hashable {
    static func ==(lhs: CharacterCounter, rhs: CharacterCounter) -> Bool {
        guard lhs.map.count == rhs.map.count else {
            return false
        }

        for (character, count) in lhs.map {
            guard rhs.map[character] == count else {
                return false
            }
        }

        return true
    }

    private var map: [Character: Int] = [:]

    init(string: String) {
        for character in string {
            add(character)
        }
    }

    var hashValue: Int {
        return map.count
    }

    mutating func add(_ character: Character) {
        map[character, default: 0] += 1
    }
}
