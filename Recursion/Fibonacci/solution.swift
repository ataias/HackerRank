import Foundation

// Source: https://www.hackerrank.com/challenges/ctci-fibonacci-numbers/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=recursion-backtracking

func fibonacci (_ n: Int) -> Int {
    switch n {
    case 0:
        return 0
    case 1:
        return 1
    default:
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

// read the integer n
let n = Int(readLine()!)!

// print the nth fibonacci number
print(fibonacci(n))
