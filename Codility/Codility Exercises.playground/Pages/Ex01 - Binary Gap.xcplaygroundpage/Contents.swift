
/* Task 1
 
 A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

 Write a function:

 public func solution(_ N : Int) -> Int

 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..2,147,483,647]. */

import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ N : Int) -> Int {
    let binaryValue = convertToBinary(N)
    
    var largestGap = 0
    var partialGap = 0
    
    var isCounting = false
    
    // Pass each value
    for index in 0 ..< binaryValue.count {

        // IF one THEN check if already counting
        if binaryValue[index] == 1 {
            // Check if started counting
            if isCounting == false {
                // IF not THEN start
                isCounting = true
            } else {
                // IF started THEN compare AND update
                if partialGap > largestGap {
                    if index != binaryValue.count-1 {
                        index
                        largestGap = partialGap
                        partialGap = 0
                        isCounting = false
                    } else if binaryValue[index] == 1 {
                        largestGap = partialGap
                        partialGap = 0
                        isCounting = false
                    }
                }
            }
        // IF zero THEN increment counter
        } else if isCounting == true {
            partialGap += 1
        }
    }
    
    return largestGap
}

func convertToBinary(_ N: Int) -> [Int] {
    var base = 1
    var binary: [Int] = []
    var partialSum = 0
    var binaryDigits = 0

    // Get max N divider
    while(base <= N) {
        binaryDigits += 1
        base *= 2
    }
    
    // Convert to
    while(base > 1) {
        base /= 2
        let checkSum = base + partialSum
        if(checkSum <= N) {
            binary.append(1)
            partialSum += base
        } else {
            binary.append(0)
        }
    }
    print(binary)
    return binary
}

solution(561892)
solution(1376796946)
solution(74901729)
solution(1)


