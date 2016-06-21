import XCTest
@testable import VaporSSL

class SSLClientStreamTests: XCTestCase {
    static var allTests = [
        ("testSend", testSend)
    ]

    func testSend() {
        do {
            let clientStream = try SSLClientStream.makeConnection(
                host: "api.spotify.com",
                port: 443,
                secure: true
            )

            let uri = "/v1/search?type=artist&q=hannah%20diamond"
            try clientStream.send("GET \(uri) HTTP/1.1\r\nHost: api.spotify.com\r\n\r\n".bytes)
            let response = try clientStream.receive(max: 2048).string

            XCTAssert(response.contains("spotify:artist:3sXErEOw7EmO6Sj7EgjHdU"))
        } catch {
            XCTFail("Could not send: \(error)")
        }
    }
}

extension Sequence where Iterator.Element == UInt8 {
    /**
        Converts a slice of bytes to
        string. Courtesy of Socks by @Czechboy0
    */
    public var string: String {
        var utf = UTF8()
        var gen = makeIterator()
        var str = String()
        while true {
            switch utf.decode(&gen) {
            case .emptyInput:
                return str
            case .error:
                break
            case .scalarValue(let unicodeScalar):
                str.append(unicodeScalar)
            }
        }
    }
}

extension String {
    var bytes: [UInt8] {
        return Array(utf8)
    }
}
