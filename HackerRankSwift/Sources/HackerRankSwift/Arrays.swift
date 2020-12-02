
/// Rotation an array left. [Problem definition on HackerRank]( https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays)
func rotLeft(a: [Int], d: Int) -> [Int] {
    let d = d % a.count
    return Array(a.dropFirst(d) + a.prefix(d))
}
