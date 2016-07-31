import TLS
import protocol Transport.Stream

/*
    Incomplete conformance of SSL.Socket. Will be updating with more thorough support
*/
extension TLS.Socket: Stream {
    // Timeout not supported
    public func setTimeout(_ timeout: Double) throws {}

    public var closed: Bool {
        return false
    }

    public func close() throws {
        //
    }


    public func flush() throws {
        // no flush, send immediately flushes
    }
}
