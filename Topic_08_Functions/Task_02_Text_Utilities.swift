import Foundation

func normalized(_ text: String) -> String {
    text.lowercased().filter { $0.isLetter || $0.isNumber }
}
func isPalindrome(_ text: String) -> Bool {
    let value = normalized(text)
    return value == String(value.reversed())
}
func vowelCount(in text: String) -> Int {
    text.lowercased().filter { "aeiou".contains($0) }.count
}
func wordCount(in text: String) -> Int {
    text.split { !$0.isLetter }.count
}
func wordCount(in text: String, minLength: Int) -> Int {
    text.split { !$0.isLetter }.filter { $0.count >= minLength }.count
}
let sample = "A man, a plan, a canal: Panama"
print(isPalindrome(sample))
print(vowelCount(in: sample))
print(wordCount(in: sample))
print(wordCount(in: sample, minLength: 3))
