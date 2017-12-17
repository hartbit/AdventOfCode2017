public class Firewall {
	private var layers: [Int: Int] = [:]

	public init() {
	}

	public func addLayer(depth: Int, range: Int) {
		layers[depth] = range
	}

	public func simulateTripSeverity(delay: Int = 0) -> Int {
		var severity: Int = 0
		for (depth, range) in layers {
			let frequency = range + max(range - 2, 0)
			if (delay + depth) % frequency == 0 {
				severity += depth * range
			}
		}
		return severity
	}

	public func willGetCaughtInTrip(delay: Int = 0) -> Bool {
		for (depth, range) in layers {
			let frequency = range + max(range - 2, 0)
			if (delay + depth) % frequency == 0 {
				return true
			}
		}
		return false
	}
}
