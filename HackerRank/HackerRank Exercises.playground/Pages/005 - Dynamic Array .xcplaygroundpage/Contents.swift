//Declare a 2-dimensional array, , of  empty arrays. All arrays are zero indexed.
//Declare an integer, , and initialize it to .
//
//There are  types of queries, given as an array of strings for you to parse:
//
//Query: 1 x y
//Let .
//Append the integer  to .
//Query: 2 x y
//Let .
//Assign the value  to .
//Store the new value of  to an answers array.
//Note:  is the bitwise XOR operation, which corresponds to the ^ operator in most languages. Learn more about it on Wikipedia.  is the modulo operator.
//Finally, size(arr[idx]) is the number of elements in arr[idx]
//
//Function Description
//
//Complete the dynamicArray function below.
//
//dynamicArray has the following parameters:
//- int n: the number of empty arrays to initialize in
//- string queries[q]: query strings that contain 3 space-separated integers
//
//Returns
//
//int[]: the results of each type 2 query in the order they are presented
//Input Format
//
//The first line contains two space-separated integers, , the size of  to create, and , the number of queries, respectively.
//Each of the  subsequent lines contains a query string, .
//
//Constraints
//
//It is guaranteed that query type  will never query an empty array or index.
//Sample Input
//
//2 5
//1 0 5
//1 1 7
//1 0 3
//2 1 0
//2 1 1
//Sample Output
//
//7
//3
//Explanation
//
//Initial Values:
//
//
// = [ ]
// = [ ]
//
//Query 0: Append  to .
//
// = [5]
// = [ ]
//
//Query 1: Append  to .
// = [5]
// = [7]
//
//Query 2: Append  to .
//
// = [5, 3]
// = [7]
//
//Query 3: Assign the value at index  of  to , print .
//
// = [5, 3]
// = [7]
//
//7
//Query 4: Assign the value at index  of  to , print .
//
// = [5, 3]
// = [7]
//
//3

// Link: https://www.hackerrank.com/challenges/dynamic-array/problem

import Foundation

/*
 * Complete the 'dynamicArray' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. 2D_INTEGER_ARRAY queries
 */

func createEmptyArray(size: Int) -> [[Int]] {
    var emptyArray: [[Int]] = []
    for _ in 0..<size {
        emptyArray.append([])
    }
    return emptyArray
}

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    var lastAnswerArray = createEmptyArray(size: n)
    var lastAnswer = 0
    var finalAnswer: [Int] = []
    
    for query in queries {
        // print("query = \(query)")
        if query.first == 1 {
            var appendValue = query[2]
            var appendIndex = (query[1] ^ lastAnswer) % n
            lastAnswerArray[appendIndex].append(appendValue)
        } else if query.first == 2 {
            var appendFromAnswerArray = (query[1] ^ lastAnswer) % n
            var appendIndex = query[2] % lastAnswerArray[appendFromAnswerArray].count
            var appendValue = lastAnswerArray[appendFromAnswerArray][appendIndex]
            finalAnswer.append(appendValue)
            lastAnswer = appendValue
        }
    }
    // print("lastAnswerArray = \(lastAnswerArray)")
    // print("finalAnswer = \(finalAnswer)")
    return finalAnswer
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let q = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

var queries = [[Int]]()

for _ in 1...q {
    guard let queriesRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let queriesRow: [Int] = queriesRowTemp.split(separator: " ").map {
        if let queriesItem = Int($0) {
            return queriesItem
        } else { fatalError("Bad input") }
    }

    guard queriesRow.count == 3 else { fatalError("Bad input") }

    queries.append(queriesRow)
}

guard queries.count == q else { fatalError("Bad input") }

let result = dynamicArray(n: n, queries: queries)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
