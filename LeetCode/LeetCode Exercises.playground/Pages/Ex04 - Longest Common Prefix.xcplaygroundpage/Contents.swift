// MARK: Name: Ex04 - Longest Common Prefix
// Link:

// MARK: Description
/*
 */

// MARK: Expected Output
/*
 */

// MARK: Solution
func longestCommonPrefix(_ strs: [String]) -> String {
    var longestPrefix = ""
    
    // Loop: Look at each character
    for letterCounter in 0..<strs[0].count {
        
        var shouldAddChar: [Bool] = []
        var letterReference: Character = "&"
        
        // Loop: Compare char by char of each string
        for str in strs {
            var letterCurrentStr: Character = "$"
            
            // Get reference letter from first String to compare
            letterReference = strs[0][strs[0].index(strs[0].startIndex, offsetBy: letterCounter)]
            
            // Safety check: IF string is smaller than reference String THEN Stop now
            if str.count > letterCounter {
                // Get reference letter from first String to compare
                letterCurrentStr = str[str.index(str.startIndex, offsetBy: letterCounter)]
            } else {
                return longestPrefix
            }
                
            // IF the letter is always equal THEN it should be added
            if letterCurrentStr == letterReference {
                shouldAddChar.append(true)
            } else {
                shouldAddChar.append(false)
            }
        }
        
        // IF none False in array THEN add letter
        if !shouldAddChar.contains(false) {
            longestPrefix.append(letterReference)
            shouldAddChar = []
        // ELSE end with result up until now
        } else {
            return longestPrefix
        }
    }
    return longestPrefix
}

// MARK: Unit Tests

longestCommonPrefix(["flower","flow","flight"]) // "fl"
longestCommonPrefix(["dog","racecar","car"]) // ""
longestCommonPrefix(["ab", "a"]) // "a"
longestCommonPrefix(["doge","dogecar","dogetcar"]) // "doge"
// MARK: COMPLETED
