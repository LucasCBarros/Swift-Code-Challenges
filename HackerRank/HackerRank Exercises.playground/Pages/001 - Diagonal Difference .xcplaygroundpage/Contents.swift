//Given a square matrix, calculate the absolute difference between the sums of its diagonals.
//
//For example, the square matrix  is shown below:
//
//1 2 3
//4 5 6
//9 8 9
//The left-to-right diagonal = . The right to left diagonal = . Their absolute difference is .
//
//Function description
//
//Complete the  function in the editor below.
//
//diagonalDifference takes the following parameter:
//
//int arr[n][m]: an array of integers
//Return
//
//int: the absolute diagonal difference
//Input Format
//
//The first line contains a single integer, , the number of rows and columns in the square matrix .
//Each of the next  lines describes a row, , and consists of  space-separated integers .
//
//Constraints
//
//Output Format
//
//Return the absolute difference between the sums of the matrix's two diagonals as a single integer.
//
//Sample Input
//
//3
//11 2 4
//4 5 6
//10 8 -12
//Sample Output
//
//15
//Explanation
//
//The primary diagonal is:
//
//11
//   5
//     -12
//Sum across the primary diagonal: 11 + 5 - 12 = 4
//
//The secondary diagonal is:
//
//     4
//   5
//10
//Sum across the secondary diagonal: 4 + 5 + 10 = 19
//Difference: |4 - 19| = 15
//
//Note: |x| is the absolute value of x

// Link: https://www.hackerrank.com/challenges/diagonal-difference/submissions/code/393794008

import Foundation

/*
 * Complete the 'diagonalDifference' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    let arrSize = arr.count
    var leftDiagonal = 0
    var rightDiagonal = 0

    for line in 0..<arrSize {
        for colunm in 0..<arrSize {
            if line + colunm == arrSize-1 {
                print("line = \(line), colunm = \(colunm)")
                rightDiagonal += arr[colunm][line]
                print("right +++ \(arr[colunm][line])")
            }
            if line == colunm {
                leftDiagonal += arr[colunm][line]
                print("left +++ \(arr[colunm][line])")
            }
        }
    }
    print("right = \(rightDiagonal)")
    print("left = \(leftDiagonal)")
    
    var diagonalDifference = leftDiagonal - rightDiagonal
    print("diff = \(diagonalDifference)")
    
    diagonalDifference = diagonalDifference < 0
    ? (-1*diagonalDifference)
    : diagonalDifference
    
    return diagonalDifference
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var arr = [[Int]]()

for _ in 1...n {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == n else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == n else { fatalError("Bad input") }

let result = diagonalDifference(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
