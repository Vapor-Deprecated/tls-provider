import TLS
import Vapor
import Socks
import SocksCore
import SecretSocks

/**
    Establish a secure SSL/TLS connection to a remote client
*/
public final class TLSServerStream: TCPProgramStream, ServerStream {
    public func accept() throws -> Stream {
        let next = try stream.accept()
        switch securityLayer {
        case .none:
            return next
        case .tls:
            return try next.makeSecret(mode: .server)
        }
    }
}
