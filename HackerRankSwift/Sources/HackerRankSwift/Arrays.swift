
/// Rotation an array left. [Problem definition on HackerRank](https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem)
func rotLeft(a: [Int], d: Int) -> [Int] {
    let d = d % a.count
    return Array(a.dropFirst(d) + a.prefix(d))
}

/// Find the minimum number of swaps in an array that contains n elements from 1 to n without repetitions. [Problem definition on HackerRank](https://www.hackerrank.com/challenges/minimum-swaps-2/problem)
func minimumSwaps(arr: [Int]) -> Int {

    struct Element {
        let value: Int
        var processed: Bool = false
    }

    var count = 0
    var arr = arr.map { Element(value: $0) }

    // We have a graph and each element has a cycle, either just from itselt to itself or going through other elements
    for i in 0..<arr.count {
        // here we are starting to track a cycle
        // i is the first element in the cycle, unless it was already processed in another cycle
        if arr[i].processed {
            continue
        }

        // we know the elements are in sequence and so we know their final index
        // we find out the correct index for the current value
        var nextIndex = arr[i].value - 1

        // we mark both as processed in this cycle
        arr[i].processed = true
        arr[nextIndex].processed = true

        // now we follow the index until we arrive at the initial element
        while i != nextIndex {
            count += 1
            nextIndex = arr[nextIndex].value - 1
            arr[nextIndex].processed = true
        }
    }

    return count
}
