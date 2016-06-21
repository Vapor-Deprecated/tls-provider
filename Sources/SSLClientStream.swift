import SSL
import Vapor
import Socks
import SocksCore
import SecretSocks

/**
    Establish a secure SSL/TLS connection to a remote server
*/
public struct SSLClientStream: ClientStream {
    public init() {}
    public static func makeConnection(host: String, port: Int, secure: Bool) throws -> Stream {
        guard secure else { 
            return try TCPClient.makeConnection(host: host, port: port, secure: false) 
        }
        
        let port = UInt16(port)
        let address = InternetAddress(hostname: host, port: port)

        let socket = try TCPInternetSocket(address: address)
        try socket.connect()

        let secureSocket = try socket.makeSecret(mode: .client)
        try secureSocket.connect()

        return secureSocket
    }
}
