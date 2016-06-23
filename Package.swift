import PackageDescription

let package = Package(
    name: "VaporSSL",
    dependencies: [
        .Package(url: "https://github.com/loganwright/SecretSocks.git", majorVersion: 0, minor: 0),
        .Package(url: "https://github.com/qutheory/vapor.git", Version(0,0,0))
    ]
)
