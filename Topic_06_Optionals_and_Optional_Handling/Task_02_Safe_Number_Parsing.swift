let input = ["10", "x", "25", "", "7.5", "40"]
let parsed = input.compactMap(Int.init)
let invalidCount = input.count - parsed.count
let firstDoubled = parsed.first.map { $0 * 2 }
print("Valid integers:", parsed)
print("Sum:", parsed.reduce(0, +))
print("Invalid entries:", invalidCount)
print("First valid doubled:", firstDoubled as Any)
