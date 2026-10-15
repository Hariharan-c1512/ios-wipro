import Foundation

let nine = 9.0
let five = 5.0
let kelvinOffset = 273.15
var celsius = 25.0

func printTemperatures(_ celsius: Double) {
    let fahrenheit = celsius * nine / five + 32
    let kelvin = celsius + kelvinOffset
    print("\(String(format: "%.1f", celsius)) °C = \(String(format: "%.1f", fahrenheit)) °F, \(String(format: "%.1f", kelvin)) K")
}

printTemperatures(celsius)
celsius = 30.0
printTemperatures(celsius)
