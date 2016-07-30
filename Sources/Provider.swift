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
    public enum Mode: String {
        case client, server
    }

    /**
        The enabled modes for this provider
    */
    public let modes: Set<Mode>

    public var client: ClientProtocol.Type? {
        guard modes.contains(.client) else { return nil }
        return Client<TLSClientStream>.self
    }

    public var server: ServerProtocol.Type? {
        guard modes.contains(.server) else { return nil }
        return Server<TLSServerStream, Parser<Request>, Serializer<Response>>.self
    }
    
    public init(modes: Mode...) {
        self.init(modes: modes)
    }

    public init(modes: [Mode] = [.client]) {
        self.modes = Set(modes)
    }
    
    public init(config: Config) throws {
        let modes = (config["tls", "modes"]?.array ?? [])
            .flatMap { $0.string }
            .flatMap { Mode(rawValue: $0) }
        
        if modes.isEmpty {
            self.init(modes: modes)
            
        } else {
            self.init()
        }
    }
    
    public var provided: Providable {
        return Providable(
            server: self.server,
            client: self.client
        )
    }
    
    public func afterInit(_: Droplet) { }
    public func beforeServe(_: Droplet) { }
}


