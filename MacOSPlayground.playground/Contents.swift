import Cocoa
import Foundation


let scores = [100, 90, 95]
let sum = scores.reduce(0, +)

let result = scores.reduce("") { $0 + String($1)}
print(result)

//let names = ["Taylor", "Paul", "Adele"]
//let count = names.reduce(0) { $0 + $1.count }
//print(count)

let numbers = [
    [1, 1, 2],
    [3, 5, 8],
    [13, 21, 34]
]
let flattened: [Int] = numbers.reduce([]) { $0 + $1 }
print(flattened)
let flattened2 = numbers.flatMap { $0 }
print(flattened2)
let flattened3 = Array(numbers.joined())
print(flattened3)

let scoresString = ["100", "95", "85", "90", "100"]
let sortedString = scoresString.sorted()
print(sortedString)

let scoresInt = scoresString.compactMap { Int($0) }
let sortedInt = scoresInt.sorted()
print(sortedInt)




struct Person: Comparable {
    var name: String
    var age: Int
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

let taylor = Person(name: "Taylor", age: 26)
let paul = Person(name: "Paul", age: 36)
let justin = Person(name: "Justin", age: 22)
let adele = Person(name: "Adele", age: 27)
let people = [taylor, paul, justin, adele]

let sortedPeople = people.sorted()
print(sortedPeople)

let names = ["Taylor", "Paul", "Adele", "Justin"]
print(names)
let sorted = names.sorted().reversed()
print(sorted)

let london = (name: "London", continent: "Europe", population:
    8_539_000)
let paris = (name: "Paris", continent: "Europe", population:
    2_244_000)
let lisbon = (name: "Lisbon", continent: "Europe", population:
    530_000)
let rome = (name: "Rome", continent: "Europe", population:
    2_627_000)
let tokyo = (name: "Tokyo", continent: "Asia", population:
    13_350_000)
let cities = [london, paris, lisbon, rome, tokyo]

let totalPopulation = cities.reduce(0) { $0 + $1.population }

let europePopulation = cities.filter { $0.continent == "Europe" }.reduce(0) { $0 + $1.population }

precedencegroup CompositionPresedence {
    associativity: left
}

infix operator >>>: CompositionPresedence

func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> (V) {
    return { rhs(lhs($0)) }
}

func generateRandomNumber(max: Int) -> Int {
    let number = Int(arc4random_uniform(UInt32(max)))
    print("Using number: \(number)")
    return number
}
func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}
func reduceToString(numbers: [Int]) -> String {
    return numbers.reduce("Factors: ") { $0 + String($1) + " "}
}
let combined = generateRandomNumber >>> calculateFactors >>> reduceToString
print(combined(100))

let numbers1 = Array(1...10000)
let lazyFilter = numbers1.lazy.filter { $0 % 2 == 0 }
let lazyMap = numbers1.lazy.map { $0 * 2 }
print(lazyFilter.count)
print(lazyFilter.count)
print(lazyMap[5000])
print(lazyMap[5000])



// EXTENSION EXAMPLES

extension BinaryInteger {
    
    // Example one:
    // Squaring Intergers
    func squared() -> Self {
        return self * self
    }
    // Example two:
    // CLAMPING INTEGERS
    func clamped(low: Self, high: Self) -> Self {
       return min(max(self, low), high)
    }
}

let i: Int = 8
print(i.squared())
let j: UInt = 10
print(j.clamped(low: 10, high: 15))
print(j.squared())

// Example three:
// MATCHING VALUE TYPES
extension Equatable {
    func matches(array items: [Self]) -> Bool {
        for item in items {
            if item != self {
                return false
            }
        }
        return true
    }
}
// Example four:
// Comparing arrays
extension Comparable {
    func lessThan(array items: [Self]) -> Bool {
        for item in items {
            if item <= self {
                return false
            }
        }
        return true
    }
}

5.lessThan(array: [6, 7, 8])
5.lessThan(array: [5, 6, 7])
"cat".lessThan(array: ["dog", "fish", "gorrila"])

// Example five:
// Rewriting contains()
extension Collection where Iterator.Element: Equatable {
    func myContains(element: Iterator.Element) -> Bool {
        for item in self {
            if item == element {
                return true
            }
        }
        return false
    }
    
}

// Example six:
// Fuzzy array matching
extension Collection where Iterator.Element: Comparable {
    func fuzzyMatches(_ other: Self) -> Bool {
        let usSorted = self.sorted()
        let otherSorted = other.sorted()
        return usSorted == otherSorted
    }
}
// Example seven:
// average string length
extension Collection where Iterator.Element == String {
    func averageLength() -> Double {
        return Double(self.reduce(0) { $0 + $1.count }) / Double(self.count)
    }
    /*
     var sum = 0
     var count = 0
     self.forEach {
        sum += $0.count
        count += 1
     }
     
     return Double(sum) / Double(count)
    */
}
["jon", "Michael", "Smith"].averageLength()


// Example eight:
// counting integers
extension Collection where Iterator.Element == Int {
    func containsFive() -> Int {
        var sum = 0
        
        /*
        // my solution:
         
        for item in self {
            String(item).compactMap { Int(String($0)) }.forEach {
                if $0 == 5 {
                    sum += 1
                }
            }
        }*/
        
        
         for item in self {
            let str = String(item)
            for letter in str {
                if letter == "5" {
                    sum += 1
                }
            }
        }
        return sum
    }
}
[5, 515].containsFive()

// Example nine:
// De-duping an array
extension Array where Element: Equatable {
    func uniqueValues() -> [Element] {
        var result = [Element]()
        for item in self {
            if !result.contains(item) {
                result.append(item)
            }
        }
        return result
    }
    
    // my solution
    func addNew(_ element: Iterator.Element) -> [Iterator.Element] {
        var array: [Iterator.Element] = Array(self)
            if !self.contains(element) {
                array.append(element)
            }
        return array
    }
    
    
}
let newArray = [4, 5, 6].addNew(4)
print(newArray)

// Example ten:
// Array is sorted
extension Array where Element: Comparable {
    func isSorted() -> Bool {
        if self == self.sorted() {
            return true
        }
        return false
    }
}
[1, 3, 2].isSorted()
