// MARK: Name: Yelp (Pre-Test) - FizzBuzz
// Link: Private

// MARK: Description
/*
 */

// MARK: Expected Output
/*
 */

// MARK: Solution
func fizzBuzz(n: Int) -> Void {

    for number in 1...n {
        let divisableBy5 = (number%5 == 0)
        let divisableBy3 = (number%3 == 0)

        if divisableBy5 && divisableBy3 {
            print("FizzBuzz")
        } else if divisableBy5 {
            print("Fizz")
        } else if divisableBy3 {
            print("Buzz")
        } else {
            print("\(number)")
        }
    }
}

// MARK: Unit Tests

fizzBuzz(n: 5)
fizzBuzz(n: 3)
fizzBuzz(n: 15)
fizzBuzz(n: 1)
fizzBuzz(n: 51)
// MARK: >> COMPLETED <<
