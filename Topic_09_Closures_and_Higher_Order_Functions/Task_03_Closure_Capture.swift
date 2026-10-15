func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}
let a = makeCounter()
let b = makeCounter()
print(a(), a(), b(), a()) // 1 2 1 3; each call creates a separate captured count.
