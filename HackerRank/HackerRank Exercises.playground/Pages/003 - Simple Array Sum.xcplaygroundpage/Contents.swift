//Given an array of integers, find the sum of its elements.
//
//For example, if the array , , so return .
//
//Function Description
//
//Complete the simpleArraySum function in the editor below. It must return the sum of the array elements as an integer.
//
//simpleArraySum has the following parameter(s):
//
//ar: an array of integers
//Input Format
//
//The first line contains an integer, , denoting the size of the array.
//The second line contains  space-separated integers representing the array's elements.
//
//Constraints
//
//
//Output Format
//
//Print the sum of the array's elements as a single integer.
//
//Sample Input
//
//6
//1 2 3 4 10 11
//Sample Output
//
//31
//Explanation
//
//We print the sum of the array's elements:

// Link: https://www.hackerrank.com/challenges/simple-array-sum/problem

import Foundation

/*
 * Complete the 'simpleArraySum' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY ar as parameter.
 */

func simpleArraySum(ar: [Int]) -> Int {
    // Write your code here
    var sum = 0
    for n in 0 ..< ar.count {
        sum += ar[n]
    }
    return sum
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == arCount else { fatalError("Bad input") }

let result = simpleArraySum(ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

