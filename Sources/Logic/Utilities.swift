import Foundation
import Commander

public enum Part: String {
	case one = "1"
	case two = "2"
}

extension Part: CustomStringConvertible {
	public var description: String {
		return rawValue
	}
}

extension Part: ArgumentConvertible {
	public init(parser: ArgumentParser) throws {
		if let value = parser.shift() {
      		if let value = Part(rawValue: value) {
        		self = value
      		} else {
        		throw ArgumentError.invalidType(value: value, type: "number", argument: nil)
      		}
    	} else {
      		throw ArgumentError.missingValue(argument: nil)
    	}
	}
}

public func read(fileAt path: String) -> String {
	do {
		let fileURL = URL(fileURLWithPath: path)
		return try String(contentsOf: fileURL, encoding: .utf8)
	} catch {
		print("error: \(error.localizedDescription)")
		exit(1)
	}
}