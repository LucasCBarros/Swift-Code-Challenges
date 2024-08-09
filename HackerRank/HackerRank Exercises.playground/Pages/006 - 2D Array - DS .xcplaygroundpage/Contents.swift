//Given a  2D Array, :
//
//1 1 1 0 0 0
//0 1 0 0 0 0
//1 1 1 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//An hourglass in  is a subset of values with indices falling in this pattern in 's graphical representation:
//
//a b c
//  d
//e f g
//There are  hourglasses in . An hourglass sum is the sum of an hourglass' values. Calculate the hourglass sum for every hourglass in , then print the maximum hourglass sum. The array will always be .
//
//Example
//
//
//-9 -9 -9  1 1 1
// 0 -9  0  4 3 2
//-9 -9 -9  1 2 3
// 0  0  8  6 6 0
// 0  0  0 -2 0 0
// 0  0  1  2 4 0
//The  hourglass sums are:
//
//-63, -34, -9, 12,
//-10,   0, 28, 23,
//-27, -11, -2, 10,
//  9,  17, 25, 18
//The highest hourglass sum is  from the hourglass beginning at row , column :
//
//0 4 3
//  1
//8 6 6
//Note: If you have already solved the Java domain's Java 2D Array challenge, you may wish to skip this challenge.
//
//Function Description
//
//Complete the function hourglassSum in the editor below.
//
//hourglassSum has the following parameter(s):
//
//int arr[6][6]: an array of integers
//Returns
//
//int: the maximum hourglass sum
//Input Format
//
//Each of the  lines of inputs  contains  space-separated integers .
//
//Constraints
//
//Output Format
//
//Print the largest (maximum) hourglass sum found in .
//
//Sample Input
//
//1 1 1 0 0 0
//0 1 0 0 0 0
//1 1 1 0 0 0
//0 0 2 4 4 0
//0 0 0 2 0 0
//0 0 1 2 4 0
//Sample Output
//
//19
//Explanation
//
// contains the following hourglasses:
//
//image
//
//The hourglass with the maximum sum () is:
//
//2 4 4
//  2
//1 2 4

// Link: https://www.hackerrank.com/challenges/2d-array/problem

import Foundation

func createEmptyArray(size: Int) -> [[Int]] {
    var emptyArray: [[Int]] = []
    var emptyLine: [Int] = []
    for line in 0..<size {
        for colunm in 0..<size {
            emptyLine.append(0)
        }
        emptyArray.append(emptyLine)
        emptyLine = []
    }
    return emptyArray
}

func hourglassSum(arr: [[Int]]) -> Int {
    var topSumArray: [[Int]] = createEmptyArray(size: arr.count-2)
    var midSumArray: [[Int]] = createEmptyArray(size: arr[0].count-2)
    var bottomSumArray: [[Int]] = createEmptyArray(size: arr.count-2)
    
    var finalSumArray: [[Int]] = createEmptyArray(size: 4)
    var highestSum = -999
    
    for line in 0..<4 {
        for colunm in 0..<4 {
            topSumArray[line][colunm] = arr[line][colunm]
            + arr[line][colunm+1]
            + arr[line][colunm+2]
        }
    }
    // print("topSumArray \(topSumArray)")
    
    for line in 2..<6 {
        for colunm in 0..<4 {
            bottomSumArray[line-2][colunm] = arr[line][colunm]
            + arr[line][colunm+1]
            + arr[line][colunm+2]
        }
    }
    // print("bottomSumArray \(bottomSumArray)")
    
    for line in 1..<5 {
        for colunm in 1..<5 {
            midSumArray[line-1][colunm-1] = arr[line][colunm]
        }
    }
    // print("midSumArray \(midSumArray)")
    
    for line in 0..<4 {
        for colunm in 0..<4 {
            finalSumArray[line][colunm] = topSumArray[line][colunm]
            + midSumArray[line][colunm]
            + bottomSumArray[line][colunm]
            if highestSum < finalSumArray[line][colunm] {
                highestSum = finalSumArray[line][colunm]
            }
        }
    }
    // print("finalSumArray \(finalSumArray)")
    
    return highestSum
}

















let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

var arr = [[Int]]()

for _ in 1...6 {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

