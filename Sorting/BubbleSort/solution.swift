import Foundation

// Source: https://www.hackerrank.com/challenges/ctci-bubble-sort/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=sorting

// Complete the countSwaps function below.
func countSwaps(a: [Int]) -> Void {
    var array = a
    var swapCount = 0
    for i in 0 ..< a.count {
        for j in 0 ..< a.count - 1 {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
                swapCount += 1
            }
        }
    }

    print("Array is sorted in \(swapCount) swaps.")
    print("First Element: \(array.first!)")
    print("Last Element: \(array.last!)")
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

countSwaps(a: a)
