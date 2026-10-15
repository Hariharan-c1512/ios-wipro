let swiftClub: Set<String> = ["Anu", "Ben", "Chitra", "Dev"]
let uiClub: Set<String> = ["Chitra", "Dev", "Esha"]
print("Both:", swiftClub.intersection(uiClub).sorted())
print("Swift only:", swiftClub.subtracting(uiClub).sorted())
print("Everyone:", swiftClub.union(uiClub).sorted())
print("Exactly one club:", swiftClub.symmetricDifference(uiClub).sorted())

let values = [3, 1, 3, 2, 1, 4]
var seen = Set<Int>()
let uniqueInOrder = values.filter { seen.insert($0).inserted }
print(uniqueInOrder)
