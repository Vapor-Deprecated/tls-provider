import XCTest
@testable import vapor-ssl

class vapor-sslTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(vapor-ssl().text, "Hello, World!")
    }


    static var allTests : [(String, (vapor-sslTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
