
/// Rotation an array left. [Problem definition on HackerRank](https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem)
func rotLeft(a: [Int], d: Int) -> [Int] {
    let d = d % a.count
    return Array(a.dropFirst(d) + a.prefix(d))
}

/// Find the minimum number of swaps in an array that contains n elements from 1 to n without repetitions. [Problem definition on HackerRank](https://www.hackerrank.com/challenges/minimum-swaps-2/problem)
func minimumSwaps(arr: [Int]) -> Int {

    // An edge in a graph
    struct Edge {
        let fromIndex: Int
        let toIndex: Int
    }

    // We will create a graph in an association list connecting indices that should be swapped
    var edges = [Edge]()
    for i in 0..<arr.count {
        let fromIndex = arr.firstIndex { $0 == i + 1 }
        edges.append(Edge(fromIndex: fromIndex!, toIndex: i))
    }
    // Remove cycles from an index to itself; not necessary for correctness
    edges.removeAll { $0.fromIndex == $0.toIndex }

    // We assume there are cycles in the solution; we need to find them
    var cycles: [[Edge]] = []
    while edges.count > 0 {
        var cycle: [Edge] = []
        var edge = edges.popLast()!
        cycle.append(edge)

        while let nextEdgeIndex = edges.firstIndex(where: { edge.toIndex == $0.fromIndex }) {
            edge = edges[nextEdgeIndex]
            cycle.append(edge)
            edges.remove(at: nextEdgeIndex)
        }

        cycles.append(cycle)
    }

    // each cycle will require cycle.count - 1 swaps
    return cycles.reduce(0) { (sum, cycle) in sum + cycle.count - 1 }
}