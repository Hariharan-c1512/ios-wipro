struct Address { let city: String? }
struct User {
    let name: String
    let age: Int?
    let address: Address?
}
func describe(_ user: User) -> String {
    guard let age = user.age else { return "\(user.name): age unknown" }
    let city = user.address?.city ?? "unknown city"
    return "\(user.name), age \(age), city: \(city)"
}
let users = [
    User(name: "Asha", age: 21, address: Address(city: "Chennai")),
    User(name: "Ravi", age: nil, address: Address(city: "Madurai")),
    User(name: "Meena", age: 20, address: Address(city: nil))
]
users.forEach { print(describe($0)) }
print(Int("42") as Any)
print(Int("abc") as Any)
