struct Counter {
    var value = 0
    mutating func increment() { value += 1 }
}
final class Box {
    var value = 0
    func increment() { value += 1 }
}
var c = Counter()
c.increment() // A struct variable must be var to call a mutating method.
print(c.value)

let b = Box()
let anotherReference = b
b.increment() // A class constant can mutate its object's properties.
print(b.value, anotherReference.value)
print("Same object:", b === anotherReference)
