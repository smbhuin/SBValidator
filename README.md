# Validator

Rule based validation library for swift.

[![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux-4E4E4E.svg?colorA=4BC51D)](#installation)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#spm)

## Installation

To install Validator, add it as a submodule to your project (on the top level project directory):

`git submodule add https://github.com/smbhuin/Validator.git`

It is recommended to enable [Whole-Module Optimization](https://swift.org/blog/whole-module-optimizations/) to gain better performance. Non-optimized build results in significantly worse performance.

#### Carthage 
You can use [Carthage](https://github.com/Carthage/Carthage). 
Specify in Cartfile:

```ruby
github "smbhuin/Validator"
```

Run `carthage` to build the framework and drag the built Validator.framework into your Xcode project. Follow [build instructions](https://github.com/Carthage/Carthage#getting-started).

#### Swift Package Manager

You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:

```swift
dependencies: [
.package(url: "https://github.com/smbhuin/Validator.git", .upToNextMinor(from: "1.0.0"))
]
```

or more strict

```swift
dependencies: [
.package(url: "https://github.com/smbhuin/Validator.git", .exact("1.0.0"))
]
```

## How to use


