extension Int {
    var isEven: Bool { self % 2 == 0 }
    func squared() -> Int { self * self }
}
extension Array where Element == Int {
    var sum: Int { reduce(0, +) }
}
extension String {
    var wordCount: Int { split { $0.isWhitespace }.count }
}
struct Version: Comparable {
    let major: Int
    let minor: Int
    static func < (lhs: Version, rhs: Version) -> Bool {
        lhs.major == rhs.major ? lhs.minor < rhs.minor : lhs.major < rhs.major
    }
}
print(4.isEven, 5.squared())
print([1, 2, 3].sum)
print("Swift is fun".wordCount)
let versions = [Version(major: 2, minor: 0), Version(major: 1, minor: 9), Version(major: 1, minor: 2)]
print(versions.sorted { $0 < $1 }.map { "\($0.major).\($0.minor)" })
