// MARK: Name: Find Smallest Array For Sum
// Link: None

// MARK: Description
/*
 Gente turuubom?
 Tem um amigo meu que ta fzd um processo seletivo pra uma vaga de dev e tem uma questão de lógica no teste, alguém sabe direcionar ou onde ele pode buscar informação?
 Eu pessoalmente não entendi:

 Dado um vetor de números e um número n. Determine a soma com o menor número de elementos entre os números do vetor mais próxima de n e também mostre os elementos que compõem a soma. Para criar a soma, utilize qualquer elemento do vetor uma ou mais vezes.

 Exemplo:

 Entrada de dados:

 N = 10
 V = [2, 3, 4]

 Saída de dados:

 10
 [2, 4, 4]
 [3, 3, 4]

 Explicação:

 Se N = 10 e V = [2, 3, 4] você pode utilizar as seguintes soma: [2, 2, 2, 2, 2], [2, 2, 3, 3], [2, 4, 4] ou [3, 3, 4]. Como a quantidade de elementos em [2, 4, 4] e [3, 3, 4] é igual, os dois conjuntos devem ser mostrados.
 */

// MARK: Expected Output
/*
 Input:
 
 N = 10
 V = [2,3,4]
 
 Output:
 
 10
 [2,4,4]
 [3,3,4]
 */

import Foundation

// MARK: Solution
// Ex: Sum = 2, Array = [1,2]
func findSmallestArrayForSum(_ sum: Int, withArray numbersArray: [Int]) -> [[Int]] {
    // 1st - find all the array of numbers that equal de Sum
    // 1.1 - Find one array for the sum
    // 1.1.1 - Start from the largest and keeping going down
    // 1.1.2 - Get the Sum % Array[index] IF =0 Then get the #x that value ELSE go to the next
    // 2nd - Get all the smallest
    
    // MARK: 1st:
    var tempArray: [Int] = []
    for value in numbersArray {
        findSmallestArrayForSum(sum-value, withArray: numbersArray)
    }
    
    // IF sum isnt Zero THEN start searching
    if sum != 0 {
        
        // IF sum is divisable by largest number THEN return the array with # times it fits
        let lastNumberIndex = numbersArray.count-1
        let lastNumber = numbersArray[lastNumberIndex]
        
        if sum % lastNumber == 0 {
            var result:[Int] = []
            for i in 0..<sum/lastNumber {
                result.append(lastNumber)
            }
            return [result]
        // ELSE get next largest
        } else {
            let SecondLastNumberIndex = numbersArray.count-2
            let SecondLastNumber = numbersArray[SecondLastNumberIndex]
            
            if (sum - lastNumber) % SecondLastNumber == 0 {
                var result:[Int] = []
                for i in 0..<sum/lastNumber {
                    result.append(lastNumber)
                }
                return [result]
                
            // ELSE get next largest
            } else {
                //... Recursion
                // Until Sum = 0 or Index = 0
            }
        }
        findSmallestArrayForSum(sum-numbersArray[0], withArray: numbersArray)
    
        // ELSE stop and return partial result to be added
    } else {
        
    }
    
    // MARK: 2nd:
    
    // Get the [[Int]] array and order by size
    
    return [[]]
}

// MARK: Unit Tests
// MARK: >> INCOMPLETE <<
