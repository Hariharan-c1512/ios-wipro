import Foundation

protocol Borrowable {
    var id: Int { get }
    var title: String { get }
    var isAvailable: Bool { get set }
}
struct Book: Borrowable {
    let id: Int
    let title: String
    var isAvailable = true
    let author: String
}
struct Magazine: Borrowable {
    let id: Int
    let title: String
    var isAvailable = true
    let issue: Int
}
enum LibraryError: Error {
    case itemNotFound(id: Int)
    case alreadyBorrowed(title: String)
    case limitReached(max: Int)
}
final class Member {
    let name: String
    private(set) var borrowedIDs: [Int] = []
    static let limit = 2
    init(name: String) { self.name = name }
    func recordBorrow(_ id: Int) throws {
        guard borrowedIDs.count < Self.limit else { throw LibraryError.limitReached(max: Self.limit) }
        borrowedIDs.append(id)
    }
    func recordReturn(_ id: Int) { borrowedIDs.removeAll { $0 == id } }
}
struct Catalog<Item: Borrowable> {
    private var items: [Item] = []
    mutating func add(_ item: Item) { items.append(item) }
    mutating func checkout(id: Int, to member: Member) throws {
        guard let index = items.firstIndex(where: { $0.id == id }) else {
            throw LibraryError.itemNotFound(id: id)
        }
        guard items[index].isAvailable else {
            throw LibraryError.alreadyBorrowed(title: items[index].title)
        }
        try member.recordBorrow(id) // Check member limit before changing availability.
        items[index].isAvailable = false
    }
}
var catalog = Catalog<Book>()
catalog.add(Book(id: 1, title: "Swift Basics", author: "A. Writer"))
catalog.add(Book(id: 2, title: "iOS Guide", author: "B. Writer"))
catalog.add(Book(id: 3, title: "Advanced Swift", author: "C. Writer"))
let member = Member(name: "Asha")
do {
    try catalog.checkout(id: 1, to: member)
    print("Borrowed book 1")
    try catalog.checkout(id: 1, to: member)
} catch { print("Checkout error:", error) }
do {
    try catalog.checkout(id: 2, to: member)
    try catalog.checkout(id: 3, to: member)
} catch { print("Checkout error:", error) }
print("Borrowed IDs:", member.borrowedIDs)
