public class Interrupt {
    public enum Style {
        case simple
        case complex
    }

    private(set) var jumps: [Int]
    private(set) var programCounter: Int = 0
    let style: Style
    
    var hasReachedExit: Bool {
        return programCounter >= jumps.count
    }

    public init(jumps: [Int], style: Style) {
        self.jumps = jumps
        self.style = style
    }

    func step() {
        guard !hasReachedExit else { return }
        let jump = jumps[programCounter]

        if style == .complex && jump >= 3 {
            jumps[programCounter] -= 1
        } else {
            jumps[programCounter] += 1
        }
        
        programCounter += jump
    }

    public func run() -> Int {
        var cycles = 0
        while !hasReachedExit {
            step()
            cycles += 1
        }

        return cycles
    }
}