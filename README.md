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
    .package(url: "https://github.com/smbhuin/SBValidator.git", from: "3.0.0")
]
```

or more strict

```swift
dependencies: [
    .package(url: "https://github.com/smbhuin/SBValidator.git", .exact("3.0.0"))
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
do {
    try v.validate()
} catch {
    debugPrint(error)
}
```

### Validation Rules

| Rules | Description |
| -- | -- |
| AlphaNumericRule | Only Alpha Numeric characters are allowed. |
| AlphaRule | Only Alpha characters are allowed. |
| ArrayLengthRule | Puts a limit on array length. |
| ArrayRule | Apply rules on each element of array. |
| CharacterSetRule |Provides set of characters to be allowed. |
| ConfirmRule | Match with specific value. |
| CoordinateRule | Takes latitude and longitude as `[Double]` and validates. |
| CurrencyRule | Takes currency as `String` and validates. |
| DateRule | Takes date as `String` and validates. |
| EmailRule | Checks for valid email. |
| EnumRule | Checks against a set of values. |
| ExactLengthRule | Checks for fixed length of `String` |
| FloatRule | Check for valid floating point number as `String` |
| FullNameRule | Checks for full name of a person. |
| HexColorRule | Validates hex color code. |
| IPV4Rule | Checks for IP v4. |
| ISBNRule | Checks for valid ISBN number. |
| ISO8601DateRule | Checks for Date String in IOS8601 format. |
| LengthRule | Checks for minimun and maximum length provided. |
| MonthRule | Checks for valid month number (`01` to `12`) |
| NumericRule | Checks for decimal degits only. |
| PasswordRule | Checks for password of desired strength. |
| PhoneNumberRule | Checks for valid phone number. |
| PinCodeRule | Checks for valid indian pin code. |
| RangeRule | Checks against minimum and maximum value provided. |
| RegexRule | Checks against regular expression provided. |
| RequiredRule | Checks if it has value, not `nil` or `empty` |
| ValidatableRule | For `struct` or `object` validation. |
| YearExpiryRule | Validates credit/debit card's expiry year. |
| ZipCodeRule | Checks for valid zip code. |

## API documentation

For more information visit our [API reference](https://smbhuin.github.io/SBValidator/).

## Credits

Thanks to [SwiftValidator](https://github.com/SwiftValidatorCommunity/SwiftValidator)

## License

This library is licensed under MIT. Full license text is available in [LICENSE](https://github.com/smbhuin/SBValidator/blob/master/LICENSE).
