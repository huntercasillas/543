// Hunter Casillas
// IS 543
// Homework 2

import UIKit

// Compute the ith Fibonacci number
func fib(i: Int) -> Int {
    
    if i == 0 {
        return 0
    } else if i == 1 {
        return 1
    }
    
    return fib(i: i - 1) + fib(i: i - 2)
}


// Compute n! (factorial) for integer n ≥ 0
func factorial(n: Int) -> Int? {
    if n < 0 {
        print("Sorry, factorial must be positive.")
        return nil
    }
    
    if n == 0 {
        return 1
    } else {
        return n * factorial(n: n - 1)!
    }
}

// Compute the sum of all integers between two given integers (inclusive)
func sum(first: Int, second: Int) -> Int {
    
    var compute = 0
    
    for i in first...second {
        compute += i
    }
    
    return compute
}

// Given a number of cents, print the corresponding U.S. coins that total to the given number
func coins(cents: Int) {
    
    var current = cents
    var quarters = 0
    var dimes = 0
    var nickels = 0
    var pennies = 0
    
    if cents < 1 {
        print("The number of cents must be positive.")
    } else {
        // Calculate quarters
        while (current - 25) >= 0 {
            quarters += 1
            current = current - 25
        }
        // Calculate dimes
        while (current - 10) >= 0 {
            dimes += 1
            current = current - 10
        }
        // Calculate nickels
        while (current - 5) >= 0 {
            nickels += 1
            current = current - 5
        }
        // Calculate pennies
        while (current - 1) >= 0 {
            pennies += 1
            current = current - 1
        }
        
        // Print answer
        var answer = ""
        // Add quarters
        if quarters == 1 {
            answer = "\(quarters) Quarter"
        } else if quarters > 1 {
            answer = "\(quarters) Quarters"
        }
        // Add dimes
        if dimes == 1 {
            if answer == "" {
                answer = "\(dimes) Dime"
            } else {
                answer += ", \(dimes) Dime"
            }
        } else if dimes > 1 {
            if answer == "" {
                answer = "\(dimes) Dimes"
            } else {
                answer += ", \(dimes) Dimes"
            }
        }
        // Add nickels
        if nickels == 1 {
            if answer == "" {
                answer = "\(nickels) Nickel"
            } else {
                answer += ", \(nickels) Nickel"
            }
        } else if nickels > 1 {
            if answer == "" {
                answer = "\(nickels) Nickels"
            } else {
                answer += ", \(nickels) Nickels"
            }
        }
        // Add pennies
        if pennies == 1 {
            if answer == "" {
                answer = "\(pennies) Penny"
            } else {
                answer += ", \(pennies) Penny"
            }
        } else if pennies > 1 {
            if answer == "" {
                answer = "\(pennies) Pennies"
            } else {
                answer += ", \(pennies) Pennies"
            }
        }
        print(answer)
    }
}
