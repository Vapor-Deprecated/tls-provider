import PackageDescription

let package = Package(
    name: "VaporSSL",
    dependencies: [
        .Package(url: "https://github.com/qutheory/ssl.git", majorVersion: 0, minor: 1),
        .Package(url: "https://github.com/qutheory/secret-socks.git", majorVersion: 0, minor: 0),
        .Package(url: "https://github.com/qutheory/vapor.git", Version(0,0,0))
    ]
)
