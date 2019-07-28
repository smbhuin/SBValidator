# Validator

Rule based validation library for swift.

[![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux-4E4E4E.svg?colorA=4BC51D)](#installation)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#spm)
[![LICENSE](https://img.shields.io/badge/License-MIT-4BC51D.svg?style=flat)](#license)

## Features

- Rule based validation
- Class/Struct validation
- Validatable/Validator chaining
- Linux Compatible (Can be used with [Kitura](https://www.kitura.io), [Vapor](https://vapor.codes), [Perfect](https://perfect.org))

## iPhone Screenshot

![Screenshot](https://raw.githubusercontent.com/smbhuin/Validator/master/screenshot.png)

## Installation

To install Validator, add it as a submodule to your project (on the top level project directory):

`git submodule add https://github.com/smbhuin/Validator.git`

#### Carthage 
You can use [Carthage](https://github.com/Carthage/Carthage). 
Specify in Cartfile:

```ruby
github "smbhuin/Validator"
```

Run `carthage` to build the framework and drag the built Validator.framework into your Xcode project. Follow [build instructions](https://github.com/Carthage/Carthage#getting-started).

#### CocoaPods

You can use [CocoaPods](http://cocoapods.org/?q=AnyValidator).

```ruby
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
pod 'AnyValidator'
end
```

or for newest version from specified branch of code:

```ruby
pod 'AnyValidator', :git => "https://github.com/smbhuin/Validator", :branch => "master"
```

#### Swift Package Manager

You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:

```swift
dependencies: [
    .package(url: "https://github.com/smbhuin/Validator.git", from: "1.0.3")
]
```

or more strict

```swift
dependencies: [
    .package(url: "https://github.com/smbhuin/Validator.git", .exact("1.0.3"))
]
```

## Usage

```swift
let v = Validator()
v.add(name: "Email", value: email, rules: [.required, .email])
v.add(name: "Name", value: name, rules: [.required, .fullName])
v.add(name: "Subject", value: subject, rules: [.required, .length(min: 10, max: 200)])
v.add(name: "Message", value: message, rules: [.required, .length(min: 10, max: 2000)])
let (valid, validatable, error) = v.validate()
```

## API documentation

For more information visit our [API reference](https://smbhuin.github.io/Validator/).

## License

This library is licensed under MIT. Full license text is available in [LICENSE](https://github.com/smbhuin/Validator/blob/master/LICENSE).
