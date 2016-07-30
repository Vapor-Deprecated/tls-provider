import TLS
import Vapor
import HTTP

public func 🔒(_ modes: Provider.Mode...) -> Provider { return Provider(modes: modes) }

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
        return Engine.HTTPClient<TLSClientStream>.self
    }

    public var server: Server.Type? {
        guard modes.contains(.server) else { return nil }
        return Engine.HTTPServer<TLSServerStream, HTTPParser<HTTPRequest>, HTTPSerializer<HTTPResponse>>.self
    }

    public init(modes: Mode...) {
        self.init(modes: modes)
    }

    public init(modes: [Mode] = [.client]) {
        self.modes = Set(modes)
    }

    public func boot(with droplet: Droplet) {}
}
