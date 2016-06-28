import PackageDescription

let package = Package(
    name: "VaporSSL",
    dependencies: [
        .Package(url: "https://github.com/czechboy0/SecretSocks.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/qutheory/vapor.git", majorVersion: 0, minor: 12)
    ]
)
