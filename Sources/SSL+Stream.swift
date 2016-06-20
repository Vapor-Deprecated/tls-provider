import SSL
import Vapor

/*
    Incomplete conformance of SSL.Socket. Will be updating with more thorough support
*/
extension SSL.Socket: Vapor.Stream {
    // Timeout not supported
    public var timeout: Double {
        get {
            return 0
        }
        set {}
    }

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
