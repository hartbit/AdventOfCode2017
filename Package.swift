// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "AdventOfCode2017",
    products: [
        .executable(name: "puzzle1", targets: ["Puzzle1"]),
        .executable(name: "puzzle2", targets: ["Puzzle2"]),
        .executable(name: "puzzle3", targets: ["Puzzle3"]),
        .executable(name: "puzzle4", targets: ["Puzzle4"]),
        .executable(name: "puzzle5", targets: ["Puzzle5"]),
        .executable(name: "puzzle6", targets: ["Puzzle6"]),
        .executable(name: "puzzle7", targets: ["Puzzle7"]),
        .executable(name: "puzzle8", targets: ["Puzzle8"]),
        .executable(name: "puzzle9", targets: ["Puzzle9"]),
        .executable(name: "puzzle10", targets: ["Puzzle10"]),
        .executable(name: "puzzle11", targets: ["Puzzle11"]),
        .executable(name: "puzzle12", targets: ["Puzzle12"]),
        .executable(name: "puzzle13", targets: ["Puzzle13"]),
        .executable(name: "puzzle14", targets: ["Puzzle14"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
        .package(url: "https://github.com/sharplet/Regex.git", from: "1.1.0"),
    ],
    targets: [
        .target(name: "Puzzle1", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle2", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle3", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle4", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle5", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle6", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle7", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle8", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle9", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle10", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle11", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle12", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle13", dependencies: ["Commander", "Logic"]),
        .target(name: "Puzzle14", dependencies: ["Commander", "Logic"]),
        .target(name: "Logic", dependencies: ["Commander", "Regex"]),
        .testTarget(name: "LogicTests", dependencies: ["Logic"])
    ]
)
