# Installation

Step by step guide to install `Mockia` using dependency managers

### SPM

The [Swift Package Manager](https://www.swift.org/package-manager) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding Mockia as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kiarashvosough1999/Mockia.git", .upToNextMajor(from: "0.0.1"))
]
```
