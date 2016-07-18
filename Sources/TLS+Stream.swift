import TLS
import protocol Engine.Stream

/*
    Incomplete conformance of SSL.Socket. Will be updating with more thorough support
*/
extension TLS.Socket: Engine.Stream {
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
