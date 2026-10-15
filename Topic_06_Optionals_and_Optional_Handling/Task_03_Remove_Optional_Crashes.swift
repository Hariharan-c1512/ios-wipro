let scores = ["Asha": 90, "Ravi": 72]
if let kiran = scores["Kiran"] {
    if let number = Int("12a") {
        print(kiran + number)
    } else {
        print("Could not convert '12a' to an integer.")
    }
} else {
    print("No score found for Kiran.")
}
