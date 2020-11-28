import UIKit

let array = [1, 55, 74, 3, 6, 56, 54, 8]

let words = ["1989", "Fearless", "Red"]
let input = "My 1989 favorite album is Fearless"

let count = words.reduce(0) { $0 + $1.count }
let result = words.filter { input.contains($0) }
print(result)
