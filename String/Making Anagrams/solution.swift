import Foundation

// Link: https://www.hackerrank.com/challenges/ctci-making-anagrams/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings

// Complete the makeAnagram function below.
func makeAnagram(a: String, b: String) -> Int {
    var frequencyA = getFrequency(a)
    var frequencyB = getFrequency(b)
    let subtractedFrequencies: [Character: Int] = subtractFrequencies(frequencyA, frequencyB)
    return subtractedFrequencies.values.reduce(0) { abs($0) + abs($1) }
}

func getFrequency(_ string: String) -> [Character: Int] {
    var frequencies = [Character: Int]()
    for c in string {
        if let frequency = frequencies[c] {
            frequencies[c] = frequency + 1
        } else {
            frequencies[c] = 1
        }
    }
    return frequencies
}

func subtractFrequencies(_ a: [Character: Int], _ b: [Character: Int]) -> [Character: Int] {
    let allKeys = Set(a.keys).union(Set(b.keys))
    var subtractFrequencies = [Character: Int]()

    for key in allKeys {
        subtractFrequencies[key] = (a[key] ?? 0) - (b[key] ?? 0)
    }
    return subtractFrequencies
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let a = readLine() else { fatalError("Bad input") }

guard let b = readLine() else { fatalError("Bad input") }

let res = makeAnagram(a: a, b: b)

fileHandle.write(String(res).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
