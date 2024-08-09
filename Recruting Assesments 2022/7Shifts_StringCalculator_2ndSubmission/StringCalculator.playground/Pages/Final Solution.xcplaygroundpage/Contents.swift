import Foundation

//MARK: - Final Adding solution

func AddValuesInString(numbers: String) throws -> Int {
    var sum = 0
    var negativeNumbers = ""
    let isComplexEntry = numbers.contains("//")
    
    // The initial values should depend on the complexity of the String
    let numbersStrings = isComplexEntry ? numbers[(numbers.firstIndex(of: "\n") ?? numbers.startIndex)...] : Substring(numbers)
    
    var numbersWithoutBreakline = numbersStrings.replacingOccurrences(of: "\n", with: "")
    
    if isComplexEntry {
        // Find & use delimiters
        let delimiterStringList = slice(numbers, from: "//", to: "\n")?.components(separatedBy: ",")
        
        delimiterStringList?.forEach({ delimiter in
            numbersWithoutBreakline = numbersWithoutBreakline.replacingOccurrences(of: delimiter, with: ",")
        })
    }
    
    let numbersArray = numbersWithoutBreakline.components(separatedBy: ",")

    // Add values according to business logic
    for number in numbersArray {
        if let intNumber = Int(number) {
            var shouldAddValue = intNumber >= 0
            
            if shouldAddValue {
                shouldAddValue = intNumber < 1000
                
                if shouldAddValue {
                    sum += intNumber
                }
            } else {
                negativeNumbers += "\(intNumber) "
            }
        }
    }
    
    guard negativeNumbers.isEmpty else {
        print("Negatives not allowed, please remove the numbers: \(negativeNumbers)")
        throw ValidationError.negativeNumbers("Negatives not allowed, please remove the numbers: \(negativeNumbers)")
    }
    
    return sum
}

// Enum of Calculator errors
enum ValidationError: Error {
    case negativeNumbers(_ numbers: String)
}

// Get string between two sets of strings
func slice(_ string: String, from: String, to: String) -> String? {
    guard let rangeFrom = string.range(of: from)?.upperBound else { return nil }
    guard let rangeTo = string[rangeFrom...].range(of: to)?.lowerBound else { return nil }
    return String(string[rangeFrom..<rangeTo])
}

/// All Test cases:
    
// MARK: - Step 1: Tests Cases

try? AddValuesInString(numbers: "1,2,3,4,5") // 15
try? AddValuesInString(numbers: "1,2,3,4,5,100") // 115
try? AddValuesInString(numbers: "") // 0

// MARK: - Step 2: Tests Cases

try? AddValuesInString(numbers: "1,2,3,\n4,5") // 15
try? AddValuesInString(numbers: "\n1") // 1

// MARK: - Step 3: Tests Cases

try? AddValuesInString(numbers: "//$\n1$2$3") // 6
try? AddValuesInString(numbers: "//@\n2@3@8") // 13
try? AddValuesInString(numbers: "//;\n1;3;4") // 8

// MARK: - Step 4: Tests Cases
try? AddValuesInString(numbers: "//$\n1$-2$3$-1$-0$-10") // Error can't add negative numbers -2,-1,-10
try? AddValuesInString(numbers: "//@\n-9@3@8@-3") // Error can't add negative numbers -9, -3
try? AddValuesInString(numbers: "//;\n1;5;-4") // Error can't add negative numbers -4
try? AddValuesInString(numbers: "//;\n;;") // 0

// Example Catching the thrown error
do {
    try AddValuesInString(numbers: "//;\n1;5;4") // 10
} catch {
    print(error)
}

// MARK: - Bonus Step: Tests Cases

//MARK: Bonus 1 - Ignores numbers bigger than 1000
try? AddValuesInString(numbers: "2,1001") // 2
try? AddValuesInString(numbers: "//;\n1;3;1001;-1") // Error can't add negative numbers -1

//MARK: Bonus 2 - Delimiters with arbitrary lenght
try AddValuesInString(numbers: "//***\n1***2***3") // 6

//MARK: Bonus 3 - List of delimiters
try AddValuesInString(numbers: "//$,@\n1$9@7") // 17

//MARK: Bonus 4 - List of delimiters with arbitraty lenghts
try AddValuesInString(numbers: "//$$,@@\n1$$4@@9") // 14
