# Change Log
All notable changes to this project will be documented in this file.
`SBValidator` adheres to [Semantic Versioning](https://semver.org/).

## Unreleased

#### Added
- `CurrencyRule` added.
- `NumericRule` added.
- `errorOnValidate` method added in `Validator`

#### Updated
- `PhoneNumberRule` updated. You can now specify the `Format` of phone number.

#### Breaking Changes
- `validate()` method now throws exception and returns `Bool`
- `validate(named: String)` method now throws exception and returns `Bool`
- `validateAll()` method now returns `[ValidationError]?`

**Previous** `validate() -> (valid: Bool, validatable: NamedValidatable?, error: ValidationError?)`
**Now** `validate() throws -> Bool`

## [2.0.1](https://github.com/smbhuin/SBValidator/releases/tag/2.0.1)
Released on 2020-02-12.

#### Renamed
- func `month` renamed to var `month` in `MonthRule` extension.

#### Updated
- `ArrayLengthRule` changed to generic from `Any` type.

## [2.0.0](https://github.com/smbhuin/SBValidator/releases/tag/2.0.0)
Released on 2020-01-07.

#### Renamed
- Framework renamed.

## [1.0.5](https://github.com/smbhuin/SBValidator/releases/tag/1.0.5)
Released on 2019-12-12.

#### Updated
- `ArrayRule` updated.

## [1.0.4](https://github.com/smbhuin/SBValidator/releases/tag/1.0.4)
Released on 2019-07-31.

#### Updated
- Package restructured.
- XCode Project Config Updated.
- Cocoapod Spec Updated.

#### Renamed
- var `ISBN` renamed to `isbn` in `ISBNRule`.
- var `IPV4` renamed to `ipv4` in `IPV4Rule`.
- var `iso8601date` renamed to `iso8601Date` in `ISO8601DateRule`.

## [1.0.3](https://github.com/smbhuin/SBValidator/releases/tag/1.0.3)
Released on 2019-07-28.

#### Updated
- Fixes for cocoapod.

## [1.0.2](https://github.com/smbhuin/SBValidator/releases/tag/1.0.2)
Released on 2019-07-28.

#### Updated
- Fixes for cocoapod.

## [1.0.1](https://github.com/smbhuin/SBValidator/releases/tag/1.0.1)
Released on 2019-07-28.

#### Updated
- Validator functions return named touples now.

## [1.0.0](https://github.com/smbhuin/SBValidator/releases/tag/1.0.0)
Released on 2019-07-27.

- Initial release of Validator.
