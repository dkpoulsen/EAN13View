import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(EAN13ViewTests.allTests),
    ]
}
#endif
