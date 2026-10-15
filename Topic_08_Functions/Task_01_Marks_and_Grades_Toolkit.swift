func average(of marks: Int...) -> Double {
    guard !marks.isEmpty else { return 0 }
    return Double(marks.reduce(0, +)) / Double(marks.count)
}
func grade(for average: Double) -> String {
    switch average {
    case 90...: return "O"
    case 80..<90: return "A+"
    case 70..<80: return "A"
    case 60..<70: return "B"
    default: return "RA"
    }
}
func stats(of marks: [Int]) -> (min: Int, max: Int, average: Double)? {
    guard let minimum = marks.min(), let maximum = marks.max() else { return nil }
    let mean = marks.isEmpty ? 0.0 : Double(marks.reduce(0, +)) / Double(marks.count)
    return (minimum, maximum, mean)
}
func curve(_ marks: inout [Int], by bonus: Int = 5) {
    marks = marks.map { min(100, $0 + bonus) }
}
print(average(of: 80, 90, 70))
print(grade(for: 84))
print(stats(of: [80, 90, 70]) as Any)
var scores = [67, 98, 99]
curve(&scores)
print(scores)
