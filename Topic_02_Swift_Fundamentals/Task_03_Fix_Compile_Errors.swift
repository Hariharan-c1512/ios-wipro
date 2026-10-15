import Foundation

let price = 300.0
let quantity: Int = 3
let taxRate = 0.18
let subtotal = price * Double(quantity)
let total = subtotal * (1 + taxRate)
var title = "Order"
title = "Updated Order"
print("\(title): total including tax = \(String(format: "%.2f", total))")
