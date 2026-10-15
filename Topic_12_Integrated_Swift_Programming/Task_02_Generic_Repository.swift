protocol Entity { var id: Int { get } }
enum RepositoryError: Error { case duplicateID(Int), notFound(Int) }
struct Repository<T: Entity> {
    private var storage: [Int: T] = [:]
    mutating func add(_ item: T) throws {
        guard storage[item.id] == nil else { throw RepositoryError.duplicateID(item.id) }
        storage[item.id] = item
    }
    func find(_ id: Int) -> T? { storage[id] }
    @discardableResult mutating func remove(_ id: Int) throws -> T {
        guard let item = storage.removeValue(forKey: id) else { throw RepositoryError.notFound(id) }
        return item
    }
    func all(where predicate: (T) -> Bool) -> [T] {
        storage.values.filter(predicate).sorted { $0.id < $1.id }
    }
}
struct Student: Entity {
    let id: Int
    let name: String
    let marks: Int
}
struct Course: Entity {
    let id: Int
    let title: String
}
var students = Repository<Student>()
do {
    try students.add(Student(id: 2, name: "Ravi", marks: 72))
    try students.add(Student(id: 1, name: "Asha", marks: 90))
    try students.add(Student(id: 1, name: "Duplicate", marks: 50))
} catch { print("Student repository error:", error) }
print(students.find(1) as Any)
print(students.all { $0.marks >= 70 }.map(\.name))
do { print(try students.remove(2)) } catch { print(error) }

var courses = Repository<Course>()
do { try courses.add(Course(id: 1, title: "Swift")); try courses.add(Course(id: 2, title: "iOS")) }
catch { print("Course repository error:", error) }
print(courses.all { _ in true }.map(\.title))
