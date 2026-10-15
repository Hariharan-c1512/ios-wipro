func makeMultiplier(_ factor: Int) -> (Int) -> Int {
    return { value in value * factor }
}
func apply(_ values: [Int], using transform: (Int) -> Int) -> [Int] {
    values.map(transform)
}
let values = [1, 2, 3, 4]
let double = makeMultiplier(2)
let triple = makeMultiplier(3)
print(apply(values, using: double))
print(apply(values, using: triple))
print(apply(values, using: { $0 * $0 }))
// Functions are first-class values because they can be stored in variables and passed as arguments.
