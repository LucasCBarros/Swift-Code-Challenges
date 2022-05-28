// MARK: Name - 
// Link:

// MARK: Description
/*
 */

// MARK: Expected Output
/*
 */

// MARK: Solution
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
 

    func isPalindrome(_ head: ListNode?) -> Bool {
        let stringPalindrome = getListString(head, resultString: "")
        return isStringPalindrome(stringPalindrome)
    }
    
    // transform list in String
    func getListString(_ head: ListNode?, resultString: String) -> String {
        var answer = resultString
        let stringValue = String(describing: head?.val)
        
        // IF there is a next node THEN add to string AND go to next node
        if head?.next != nil {
            answer.append(stringValue)
        }
        
        return resultString
    }
    
    func isStringPalindrome(_ x: String) -> Bool {
            if x == reverseString(x) {
                return true
            } else {
                return false
            }
        }
        
        func reverseString(_ text: String) -> String {
            var reversedString = ""
            for char in text {
//                reversedString = "\(char)\(reversedString)"
                reversedString = String(char) + reversedString
            }
            return reversedString
        }

// MARK: Unit Tests

isStringPalindrome("1234") // False
isStringPalindrome("1221") // True
// MARK: COMPLETED
