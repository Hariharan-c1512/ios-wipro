protocol Flyable { func fly() }
protocol Swimmable { func swim() }
struct Duck: Flyable, Swimmable {
    func fly() { print("Duck flies") }
    func swim() { print("Duck swims") }
}
struct Eagle: Flyable { func fly() { print("Eagle flies") } }
struct Fish: Swimmable { func swim() { print("Fish swims") } }

func showOff(_ animal: Flyable & Swimmable) {
    animal.fly()
    animal.swim()
}
showOff(Duck())
// showOff(Eagle()) // Does not compile: Eagle cannot swim.
// Composition combines capabilities without forcing unrelated types into one inheritance tree.
