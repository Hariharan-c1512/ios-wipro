let sentence = "swift is fun and swift is fast"

let words = sentence.split(separator: " ").map { String($0) }

var wordCount: [String: Int] = [:]

for word in words {
    wordCount[word, default: 0] += 1
}

print("Total words:", words.count)
print("Unique words:", Set(words).sorted())
print("Word frequency:", wordCount)

let sortedWords = wordCount.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    }
    return $0.value > $1.value
}

for (word, count) in sortedWords {
    print("\(word): \(count)")
}
