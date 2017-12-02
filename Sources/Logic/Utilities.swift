import Foundation

public func read(fileAt path: String) -> String {
	do {
		let fileURL = URL(fileURLWithPath: path)
		return try String(contentsOf: fileURL, encoding: .utf8)
	} catch {
		print("error: \(error.localizedDescription)")
		exit(1)
	}
}