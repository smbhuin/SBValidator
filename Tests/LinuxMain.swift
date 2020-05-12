import XCTest

import SBValidator

var tests = [XCTestCaseEntry]()
tests += ValidatorTests.allTests()
XCTMain(tests)

