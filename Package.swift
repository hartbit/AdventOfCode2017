// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Puzzle1",
    products: [
        .executable(name: "puzzle-1-1", targets: ["Puzzle_1_1"]),
        .executable(name: "puzzle-1-2", targets: ["Puzzle_1_2"]),
        .executable(name: "puzzle-2-1", targets: ["Puzzle_2_1"]),
        .executable(name: "puzzle-2-2", targets: ["Puzzle_2_2"]),
    ],
    targets: [
        .target(name: "Puzzle_1_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_1_2", dependencies: ["Logic"]),
        .target(name: "Puzzle_2_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_2_2", dependencies: ["Logic"]),
        .target(name: "Logic", dependencies: []),
        .testTarget(name: "LogicTests", dependencies: ["Logic"])
    ]
)
