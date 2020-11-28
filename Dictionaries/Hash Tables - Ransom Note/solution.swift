import Foundation

// Complete the checkMagazine function below.
func checkMagazine(magazine: [String], note: [String]) -> Void {
    let magazineFrequencies = getFrequencies(magazine)
    let noteFrequencies = getFrequencies(note)

    let diff = subtractFrequencies(magazineFrequencies, noteFrequencies)
    let canRecreateNote = diff.values.reduce(true) { $0 && $1 >= 0 }
    print(canRecreateNote ? "Yes" : "No")
}

func getFrequencies<T>(_ elements: [T]) -> [T: Int] {
    var frequencies = [T: Int]()
    for el in elements {
        if let frequency = frequencies[el] {
            frequencies[el] = frequency + 1
        } else {
            frequencies[el] = 1
        }
    }
    return frequencies
}

func subtractFrequencies<T>(_ a: [T: Int], _ b: [T: Int]) -> [T: Int] {
    let allKeys = Set(a.keys).union(Set(b.keys))
    var subtractFrequencies = [T: Int]()

    for key in allKeys {
        subtractFrequencies[key] = (a[key] ?? 0) - (b[key] ?? 0)
    }
    return subtractFrequencies
}

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let magazineTemp = readLine() else { fatalError("Bad input") }
let magazine: [String] = magazineTemp.split(separator: " ").map {
    String($0)
}

guard magazine.count == m else { fatalError("Bad input") }

guard let noteTemp = readLine() else { fatalError("Bad input") }
let note: [String] = noteTemp.split(separator: " ").map {
    String($0)
}

guard note.count == n else { fatalError("Bad input") }

checkMagazine(magazine: magazine, note: note)

