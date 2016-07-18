import PackageDescription

let package = Package(
    name: "VaporTLS",
    dependencies: [
        .Package(url: "https://github.com/czechboy0/SecretSocks.git", majorVersion: 0, minor: 4),
        .Package(url: "https://github.com/qutheory/vapor.git", majorVersion: 0, minor: 14)
    ]
)
