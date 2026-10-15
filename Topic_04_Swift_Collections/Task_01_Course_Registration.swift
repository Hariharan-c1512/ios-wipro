var subjects = ["Swift", "UIKit", "SwiftUI"]
subjects.append("Networking")
subjects.insert("Testing", at: 1)
if let index = subjects.firstIndex(of: "UIKit") { subjects.remove(at: index) }
print("Sorted subjects:", subjects.sorted())

var registered: Set<String> = ["Asha", "Ravi"]
registered.insert("Asha")
print("Unique students:", registered.count, registered.sorted())

var marks = ["Asha": 90, "Ravi": 72, "Meena": 88]
marks["Kiran"] = 81
marks["Ravi"] = 78
print("Missing mark:", marks["Dev"] as Any)
for (name, mark) in marks.sorted(by: { $0.key < $1.key }) {
    print("\(name): \(mark)")
}
if let top = marks.max(by: { $0.value < $1.value }) {
    print("Highest: \(top.key) = \(top.value)")
}
