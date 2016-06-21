import SSL
import Vapor
import Socks
import SocksCore
import SecretSocks

/**
    Establish a secure SSL/TLS connection to a remote client
*/
public struct SSLStreamDriver: StreamDriver {
    public static func listen(host: String, port: Int, handler: (Stream) throws -> ()) throws {
        let port = UInt16(port)
        let address = InternetAddress(hostname: host, port: port)
        let server = try SynchronousTCPServer(address: address)
        try server.startWithHandler { socket in
            let secureSocket = try socket.socket.makeSecret(mode: .server)
            try secureSocket.accept()

            try handler(secureSocket)
        }
    }
}
