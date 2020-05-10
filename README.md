# SBValidator

Rule based validation library for swift.

[![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux-4E4E4E.svg?colorA=4BC51D)](#installation)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#spm)
[![LICENSE](https://img.shields.io/badge/License-MIT-4BC51D.svg?style=flat)](#license)

## Features

- Rule based validation
- Class/Struct validation
- JSON validation
- Validatable/Validator chaining
- Linux Compatible (Can be used with [Kitura](https://www.kitura.io), [Vapor](https://vapor.codes), [Perfect](https://perfect.org))

## iPhone Screenshot

![Screenshot](https://raw.githubusercontent.com/smbhuin/SBValidator/master/screenshot.png)

## Installation

To install Validator, add it as a submodule to your project (on the top level project directory):

`git submodule add https://github.com/smbhuin/SBValidator.git`

#### Carthage 
You can use [Carthage](https://github.com/Carthage/Carthage). 
Specify in Cartfile:

```ruby
github "smbhuin/SBValidator"
```

Run `carthage` to build the framework and drag the built SBValidator.framework into your Xcode project. Follow [build instructions](https://github.com/Carthage/Carthage#getting-started).

#### CocoaPods

You can use [CocoaPods](http://cocoapods.org/?q=SBValidator).

```ruby
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
pod 'SBValidator'
end
```

or for newest version from specified branch of code:

```ruby
pod 'SBValidator', :git => "https://github.com/smbhuin/SBValidator", :branch => "master"
```

#### Swift Package Manager

You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:

```swift
dependencies: [
    .package(url: "https://github.com/smbhuin/SBValidator.git", from: "2.0.1")
]
```

or more strict

```swift
dependencies: [
    .package(url: "https://github.com/smbhuin/SBValidator.git", .exact("2.0.1"))
]
```

## Usage

```swift
import SBValidator

let v = Validator()
v.add(name: "Email", value: email, rules: [.required, .email])
v.add(name: "Name", value: name, rules: [.required, .fullName])
v.add(name: "Subject", value: subject, rules: [.required, .length(min: 10, max: 200)])
v.add(name: "Message", value: message, rules: [.required, .length(min: 10, max: 2000)])
let (valid, validatable, error) = v.validate()
```

### Validation Rules

| Rules          | Description               |
| -------------- | ------------------------- |
| AlphaNumericRule | Only Alpha Numeric characters are allowed. |
| AlphaRule | Only Alpha characters are allowed. |
| ArrayLengthRule | Puts a limit on array length. |
| ArrayRule |Apply rules on each element of array.|
| CharacterSetRule |Provides set of characters to be allowed.|
| ConfirmRule |Match with specific value.|
| CoordinateRule |Takes latitude and longitude as `[Double]` and validates.|
| CurrencyRule |Takes currency as `String` and validates.|
| DateRule |Takes date as `String` and validates.|
| EmailRule |Checks for valid email.|
| EnumRule |Checks against a set of values.|
| ExactLengthRule |Checks for fixed length of `String`|
| FloatRule |Check for valid floating point number as `String`|
| FullNameRule |Checks for full name of a person.|
| HexColorRule ||
| IPV4Rule ||
| ISBNRule ||
| ISO8601DateRule ||
| LengthRule ||
| MonthRule ||
| NumericRule ||
| PasswordRule ||
| PhoneNumberRule ||
| PinCodeRule ||
| RangeRule ||
| RegexRule ||
| RequiredRule ||
| ValidatableRule ||
| ValidationRule ||
| YearExpiryRule ||
| ZipCodeRule ||

## API documentation

For more information visit our [API reference](https://smbhuin.github.io/SBValidator/).

## License

This library is licensed under MIT. Full license text is available in [LICENSE](https://github.com/smbhuin/SBValidator/blob/master/LICENSE).
