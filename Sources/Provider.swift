import SSL
import Vapor
import Socks
import SocksCore
import SecretSocks

public var 🔒: Provider { return Provider(modes: .client) }

/**
    A provider that allows SSL Client and or Server
*/
public struct Provider: Vapor.Provider {
    /**
         Which modes to enable. It's very common that applications will serve behind nginx and use
         ssl only for outgoing calls.
     */
    public enum Mode {
        case client, server
    }

    /**
        The enabled modes for this provider
    */
    public let modes: Set<Mode>

    public var client: Client.Type? {
        guard modes.contains(.client) else { return nil }
        return HTTPClient<SSLClientStream>.self
    }

    public var server: Server.Type? {
        guard modes.contains(.server) else { return nil }
        return HTTPServer<SSLServerStream, HTTPParser<HTTPRequest>, HTTPSerializer<HTTPResponse>>.self
    }

    public init(modes: Mode...) {
        self.modes = Set(modes)
    }

    public func boot(with application: Application) {}
}
