struct Stack<Element> {
    private var items: [Element] = []
    mutating func push(_ item: Element) { items.append(item) }
    @discardableResult mutating func pop() -> Element? { items.popLast() }
    var top: Element? { items.last }
    var isEmpty: Bool { items.isEmpty }
    var count: Int { items.count }
}
func largest<T: Comparable>(in items: [T]) -> T? { items.max() }
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}
var numbers = Stack<Int>()
numbers.push(10); numbers.push(20)
print(numbers.top as Any, numbers.pop() as Any, numbers.count)
var words = Stack<String>()
words.push("Swift")
print(words.top as Any, words.isEmpty)
print(largest(in: [4, 9, 2]) as Any)
print(largest(in: ["cat", "zebra", "dog"]) as Any)
var first = 1, second = 2
swapValues(&first, &second)
print(first, second)
// largest requires Comparable; a custom non-Comparable type causes a compile-time constraint error.
