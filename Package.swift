// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Puzzle1",
    products: [
        .executable(name: "puzzle-1-1", targets: ["Puzzle_1_1"]),
        .executable(name: "puzzle-1-2", targets: ["Puzzle_1_2"]),
    ],
    targets: [
        .target(name: "Puzzle_1_1", dependencies: []),
        .target(name: "Puzzle_1_2", dependencies: []),
    ]
)