
import Foundation

// Source: https://www.hackerrank.com/challenges/balanced-brackets/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=stacks-queues

// Complete the isBalanced function below.
func isBalanced(s: String) -> String {
    var stack = Stack<Character>()

    for c in s {
        switch c {
        case "(", "[", "{":
            stack.push(c);
        case ")", "]", "}":
            let left = stack.pop();
            if let left = left, isMatchingBracket(left, c) {
                continue
            } else {
                return "NO"
            }
        default:
            return "INVALID"
        }

    }

    return stack.isEmpty() ?  "YES" : "NO"
}

func isMatchingBracket(_ left: Character, _ right: Character) -> Bool {
    switch (left, right) {
    case ("(", ")"), ("[", "]"), ("{", "}"):
        return true
    default:
        return false
    }
}

// adapted from https://www.journaldev.com/21287/swift-stack-implementation
struct Stack<T> {
    private var array: [T] = []

    mutating func push(_ element: T) {
        array.append(element)
    }

    mutating func pop() -> T? {
        return array.popLast()
    }

    func peek() -> T? {
        return array.last
    }

    func isEmpty() -> Bool {
        return array.count == 0
    }

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = isBalanced(s: s)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
