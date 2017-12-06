// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "AdventOfCode2017",
    products: [
        .executable(name: "puzzle-1-1", targets: ["Puzzle_1_1"]),
        .executable(name: "puzzle-1-2", targets: ["Puzzle_1_2"]),
        .executable(name: "puzzle-2-1", targets: ["Puzzle_2_1"]),
        .executable(name: "puzzle-2-2", targets: ["Puzzle_2_2"]),
        .executable(name: "puzzle-3-1", targets: ["Puzzle_3_1"]),
        .executable(name: "puzzle-3-2", targets: ["Puzzle_3_2"]),
        .executable(name: "puzzle-4-1", targets: ["Puzzle_4_1"]),
        .executable(name: "puzzle-4-2", targets: ["Puzzle_4_2"]),
        .executable(name: "puzzle-5-1", targets: ["Puzzle_5_1"]),
        .executable(name: "puzzle-5-2", targets: ["Puzzle_5_2"]),
        .executable(name: "puzzle-6-1", targets: ["Puzzle_6_1"]),
        .executable(name: "puzzle-6-2", targets: ["Puzzle_6_2"]),
    ],
    targets: [
        .target(name: "Puzzle_1_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_1_2", dependencies: ["Logic"]),
        .target(name: "Puzzle_2_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_2_2", dependencies: ["Logic"]),
        .target(name: "Puzzle_3_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_3_2", dependencies: ["Logic"]),
        .target(name: "Puzzle_4_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_4_2", dependencies: ["Logic"]),
        .target(name: "Puzzle_5_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_5_2", dependencies: ["Logic"]),
        .target(name: "Puzzle_6_1", dependencies: ["Logic"]),
        .target(name: "Puzzle_6_2", dependencies: ["Logic"]),
        .target(name: "Logic", dependencies: []),
        .testTarget(name: "LogicTests", dependencies: ["Logic"])
    ]
)
