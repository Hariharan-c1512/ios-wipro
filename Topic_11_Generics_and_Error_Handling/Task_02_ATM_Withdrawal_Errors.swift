enum ATMError: Error {
    case insufficientFunds(shortBy: Double)
    case invalidAmount
    case dailyLimitExceeded
}
struct Account {
    var balance: Double
    let dailyLimit = 20_000.0
    mutating func withdraw(_ amount: Double) throws {
        guard amount > 0 else { throw ATMError.invalidAmount }
        guard amount <= dailyLimit else { throw ATMError.dailyLimitExceeded }
        guard amount <= balance else { throw ATMError.insufficientFunds(shortBy: amount - balance) }
        balance -= amount
        print("Withdrawal successful. Balance: \(balance)")
    }
}
var account = Account(balance: 10_000)
for amount in [500.0, -10.0, 25_000.0, 15_000.0] {
    do {
        try account.withdraw(amount)
    } catch ATMError.invalidAmount {
        print("Amount must be positive.")
    } catch ATMError.dailyLimitExceeded {
        print("Daily withdrawal limit exceeded.")
    } catch ATMError.insufficientFunds(let shortBy) {
        print("Insufficient funds; short by \(shortBy).")
    } catch {
        print("Unexpected error: \(error)")
    }
}
let optionalAttempt = try? account.withdraw(100)
print("Optional attempt:", optionalAttempt as Any)
