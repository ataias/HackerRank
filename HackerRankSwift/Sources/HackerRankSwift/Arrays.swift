
/// Rotation an array left. [Problem definition on HackerRank](https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem)
func rotLeft(a: [Int], d: Int) -> [Int] {
    let d = d % a.count
    return Array(a.dropFirst(d) + a.prefix(d))
}

/// Find the minimum number of swaps in an array that contains n elements from 1 to n without repetitions. [Problem definition on HackerRank](https://www.hackerrank.com/challenges/minimum-swaps-2/problem)
func minimumSwaps(arr: [Int]) -> Int {

    // An edge in a graph
    struct Element {
        let value: Int
        var processed: Bool = false
    }

    // We will create a graph in an association list connecting indices that should be swapped
    var count = 0
    var newArray = arr.map { Element(value: $0) }

    for currentIndex in 0..<newArray.count {
        if newArray[currentIndex].processed {
            continue
        }
        
        var nextIndex = newArray[currentIndex].value - 1

        newArray[currentIndex].processed = true
        newArray[nextIndex].processed = true

        while currentIndex != nextIndex {
            count += 1
            nextIndex = newArray[nextIndex].value - 1
            newArray[nextIndex].processed = true
        }
    }

    return count
}
