protocol Entity { var id: Int { get } }
protocol Describable { var summary: String { get } }
struct Repository<T: Entity> {
    private var storage: [Int: T] = [:]
    mutating func add(_ item: T) { storage[item.id] = item }
    func all() -> [T] { storage.values.sorted { $0.id < $1.id } }
}
extension Repository where T: Describable {
    func printReport() {
        for item in all() { print(item.summary) }
    }
}
struct Student: Entity, Describable {
    let id: Int
    let name: String
    let marks: Int
    var summary: String { "Student #\(id): \(name), marks \(marks)" }
}
struct Course: Entity, Describable {
    let id: Int
    let title: String
    var summary: String { "Course #\(id): \(title)" }
}
struct PlainRecord: Entity { let id: Int }

var studentRepo = Repository<Student>()
studentRepo.add(Student(id: 1, name: "Asha", marks: 90))
studentRepo.add(Student(id: 2, name: "Ravi", marks: 72))
studentRepo.printReport()

var courseRepo = Repository<Course>()
courseRepo.add(Course(id: 1, title: "Swift"))
courseRepo.printReport()

var plainRepo = Repository<PlainRecord>()
plainRepo.add(PlainRecord(id: 1))
// plainRepo.printReport() // Does not compile because PlainRecord is not Describable.
