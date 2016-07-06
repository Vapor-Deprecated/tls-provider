import TLS
import Vapor
import Socks
import SocksCore
import SecretSocks

/**
    Establish a secure SSL/TLS connection to a remote server
*/
public final class TLSClientStream: TCPProgramStream, ClientStream {

    public func connect() throws -> Stream {
        try stream.connect()
        switch securityLayer {
        case .none:
            return stream
        case .tls:
            let secure = try stream.makeSecret(mode: .client)
            try secure.connect()
            return secure
        }
    }
}
