public enum StreamElement {
	case group([StreamElement])
	case garbage(String)

	public var score: Int {
        return score(depth: 1)
	}

	public var garbageCount: Int {
        switch self {
        case .group(let elements):
            return elements.reduce(0, { $0 + $1.garbageCount })
        case .garbage(let garbage):
            return garbage.count
        }
	}

    private func score(depth: Int) -> Int {
        switch self {
        case .group(let elements):
            return elements.reduce(depth, { $0 + $1.score(depth: depth + 1) })
        case .garbage:
            return 0
        }
    }
}

public class StreamParser {
	private enum State {
		case parsingElement
        case parsingGroup
		case parsingGarbage
		case parsingIgnored
        case parsingComma
	}

	private var elementStack: [StreamElement] = []
	private var parsingState: State = .parsingElement

	public init() {
	}

	public func parse(_ stream: String) -> StreamElement {
		for character in stream {
			parse(character)
		}

		guard elementStack.count == 1 else {
			fatalError("stream not finished")
		}

        let result = elementStack[0]
        elementStack.removeAll()
        parsingState = .parsingElement
        return result
	}

	private func parse(_ character: Character) {
		switch parsingState {
		case .parsingElement:
			parseElement(character)
        case .parsingGroup:
            parseGroup(character)
		case .parsingGarbage:
			parseGarbage(character)
		case .parsingIgnored:
            parseIgnored(character)
        case .parsingComma:
            parseComma(character)
		}
	}

    private func parseElement(_ character: Character) {
        switch character {
        case "{":
            elementStack.append(.group([]))
            parsingState = .parsingGroup
        case "<":
            elementStack.append(.garbage(""))
            parsingState = .parsingGarbage
        default:
            fatalError("unexpected character: \(character)")
        }
    }

    private func parseGroup(_ character: Character) {
        switch character {
        case "{":
            elementStack.append(.group([]))
        case "<":
            elementStack.append(.garbage(""))
            parsingState = .parsingGarbage
        case "}":
            finishElement()
        default:
            fatalError("unexpected character: \(character)")
        }
    }

    private func parseGarbage(_ character: Character) {
        switch character {
        case "!":
            parsingState = .parsingIgnored
        case ">":
            finishElement()
        default:
            parseRawGarbage(character)
        }
    }

    private func parseIgnored(_ character: Character) {
        parsingState = .parsingGarbage
    }

    private func parseComma(_ character: Character) {
        switch character {
        case ",":
            parsingState = .parsingElement
        case "}":
            finishElement()
        default:
            parseRawGarbage(character)
        }
    }

    private func finishElement() {
        guard elementStack.count > 1 else {
            return
        }

        let element = elementStack.removeLast()

        guard case .group(var elements) = elementStack.removeLast() else {
            fatalError("Impossibru!")
        }

        elements.append(element)
        elementStack.append(.group(elements))
        parsingState = .parsingComma
    }

    private func parseRawGarbage(_ character: Character) {
        guard case .garbage(var garbage) = elementStack.removeLast() else {
            fatalError("Impossibru!")
        }

        garbage.append(character)
        elementStack.append(.garbage(garbage))
    }
}

extension StreamElement: Equatable {
	public static func ==(lhs: StreamElement, rhs: StreamElement) -> Bool {
		switch (lhs, rhs) {
		case (.group(let lhsElements), .group(let rhsElements)):
			return lhsElements == rhsElements
		case (.garbage(let lhsGarbage), .garbage(let rhsGarbage)):
			return lhsGarbage == rhsGarbage
		default:
			return false
		}
	}
}
