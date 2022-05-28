// MARK: Name - Ex01: Palindrome checker
// Link:

// MARK: Description
/*
 */

// MARK: Expected Output
/*
 */

// MARK: Solution
func isPalindrome(_ x: Int) -> Bool {
        
        var xString = String(x)
        var xStringReversed = reverseString(xString)
        if xString == xStringReversed {
            return true
        } else {
            return false
        }
    }
    
    func reverseString(_ text: String) -> String {
        var reversedString = ""
        for char in text {
            reversedString = "\(char)\(reversedString)"
        }
        return reversedString
    }

// MARK: Unit Tests
isPalindrome(12223) // False
// MARK: COMPLETED
