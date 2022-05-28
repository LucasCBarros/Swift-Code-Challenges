// MARK: Name - Ex 03: Roman to Int
// Link:

// MARK: Description
/*
 */

// MARK: Expected Output
/*
 */

// MARK: Solution
func romanToInt(_ s: String) -> Int {
    // Safe the number of characters
    let charCounter = s.count
    var resultNumber = 0
    var shouldSkipNextChar = false
    
    // Check all characters
    for charIndex in 0..<charCounter {
        if shouldSkipNextChar {
            shouldSkipNextChar = false
            continue
        } else {
            shouldSkipNextChar = false
        }
        
        let currentChar = s[s.index(s.startIndex, offsetBy: charIndex)]
        var nextChar = ""
        if charIndex < charCounter-1 {
            nextChar = String(s[s.index(s.startIndex, offsetBy: charIndex+1)])
        }
        
        switch currentChar {
        case "I":
            if nextChar == "V" {
                resultNumber += 4
                shouldSkipNextChar = true
            } else if nextChar == "X" {
                resultNumber += 9
                shouldSkipNextChar = true
            } else {
                resultNumber += 1
            }
            
        case "V":
            resultNumber += 5
            
        case "X":
            if nextChar == "L" {
                resultNumber += 40
                shouldSkipNextChar = true
            } else if nextChar == "C" {
                resultNumber += 90
                shouldSkipNextChar = true
            } else {
                resultNumber += 10
            }
            
        case "L":
            resultNumber += 50
       
        case "C":
            if nextChar == "D" {
                resultNumber += 400
                shouldSkipNextChar = true
            } else if nextChar == "M" {
                resultNumber += 900
                shouldSkipNextChar = true
            } else {
                resultNumber += 100
            }
            
        case "D":
            resultNumber += 500
            
        case "M":
            resultNumber += 1000
            
        default:
            resultNumber = 9999
        }
    }
    
    return resultNumber
}

// MARK: Unit Tests

romanToInt("II") // 2
romanToInt("IV") // 4
romanToInt("MCMXCIV") // 1994
romanToInt("XXI") // 21
// MARK: COMPLETED
