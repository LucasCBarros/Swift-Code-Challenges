// MARK: Name: Ex05 - Parentheses Validator
// Link: https://leetcode.com/problems/valid-parentheses/submissions/

// MARK: Description
/*
 Validate if all parentheses have been opened and closed in the correct order
 */

// MARK: Expected Output
/*
 */

// MARK: Solution
import Foundation

func isValid(_ s: String) -> Bool {
    var isValidString = true
    // LOOP throw string IF open THEN stack in pile UNTIL find close THEN unstack
    var keyStack = ""
    
    // Loop throw string
    for char in s {
        
        switch char {
        // IF open symbol THEN stack in pile
        case "(","{","[":
            keyStack.append(char)
            isValidString = false
        // IF close symbol THEN check last in pile, if sabe type then popLast ELSE end false
        case ")":
            if keyStack.last == "(" {
                keyStack.removeLast()
                isValidString = true
            } else {
                return false
            }
        case "}":
            if keyStack.last == "{" {
                keyStack.removeLast()
                isValidString = true
            } else {
                return false
            }
        case "]":
            if keyStack.last == "[" {
                keyStack.removeLast()
                isValidString = true
            } else {
                return false
            }
        default:
            // invalid char
            return false
        }
    }
    if keyStack.isEmpty {
        return isValidString
    } else {
        return false
    }
}

// MARK: Unit Tests
isValid("()") // true
isValid("(){}[]") // true
isValid("({[]})") // true
isValid("(}") // false
isValid("(})") // false
isValid("[") // false
isValid("[()") // false
// MARK: >> COMPLETED <<
