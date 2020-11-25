import Foundation

/// Returns the maximum hour glass sum from a 2D Array
func hourglassSum(arr: [[Int]]) -> Int {
    let numberOfRows = arr.count
    precondition(numberOfRows >= 3, "Hourglass require an array of at least 3 in number of rows")
    let numberOfColumns = arr[0].count
    precondition(numberOfColumns >= 3, "Hourglass require an array of at least 3 in number of columns")
    precondition(arr.map { $0.count == numberOfColumns }.reduce(true) { $0 && $1 }, "All columns must have equal length!")

    var maxSum: Int?

    for i in 1..<numberOfRows - 1 {
        for j in 1..<numberOfRows - 1 {
            let sum = arr[i-1][j-1] + arr[i-1][j] + arr[i-1][j+1] + arr[i][j] + arr[i+1][j-1] + arr[i+1][j] + arr[i+1][j+1]
            if maxSum == nil {
                maxSum = sum
            } else if let currentMaxSum = maxSum, sum > currentMaxSum {
                maxSum = sum
            }
        }
    }
    return maxSum!
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

