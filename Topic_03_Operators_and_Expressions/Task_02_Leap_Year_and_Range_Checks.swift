let years = [1900, 2000, 2024, 2026]
for year in years {
    let isLeap = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    print("\(year) leap year? \(isLeap)")
}

let number = 42
print("Between 1 and 100: \((1...100).contains(number))")
print("Even and not multiple of 10: \(number % 2 == 0 && number % 10 != 0)")

let nickname: String? = nil
print(nickname ?? "Guest")
