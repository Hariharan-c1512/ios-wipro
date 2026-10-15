import Foundation

let studentName = "Asha"
let rollNumber: Int = 2301
var semester: Int = 5
var cgpa: Double = 8.25
let isHosteller: Bool = true

print("Name: \(studentName), Roll: \(rollNumber), Semester: \(semester)")
semester += 1
cgpa = 8.40
print("Name: \(studentName), Roll: \(rollNumber), Semester: \(semester), CGPA: \(cgpa)")
// studentName = "Ravi" // Error: a let constant cannot be changed.

print(type(of: studentName), type(of: rollNumber), type(of: semester))
print(type(of: cgpa), type(of: isHosteller))
