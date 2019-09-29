// Hunter Casillas
// IS 543
// Interesting Aspects of Swift

import UIKit

// TUPLES:
// twelve is of type (Int, String), and equals (12, "Twelve")
let twelve = (12, "Twelve")

// You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (number, writtenNumber) = twelve
print("The number is \(number)")
print("The number written out is \(writtenNumber)")

// You can name the individual elements in a tuple when the tuple is defined:
let booleanMap = (code: 1, description: "true")

// If you name the elements in a tuple, you can use the element names to access the values of those elements:
print("The code is \(booleanMap.code)")
print("The description is \(booleanMap.description)")


// OPTIONALS
let possibleNumber = "12"

// You can rewrite possibleNumber to use optional binding rather than forced unwrapping:
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}

// STRINGS
//If you need a string that spans several lines, use a multiline string literal—a sequence of characters surrounded by three double quotation marks:
let quotation = """
Two roads diverged in a yellow wood,
And sorry I could not travel both
And be one traveler, long I stood
And looked down one as far as I could
To where it bent in the undergrowth;
Then took the other, as just as fair,
And having perhaps the better claim,
Because it was grassy and wanted wear;
Though as for that the passing there
Had worn them really about the same,
And both that morning equally lay
In leaves no step had trodden black.
Oh, I kept the first for another day!
Yet knowing how way leads on to way,
I doubted if I should ever come back.
I shall be telling this with a sigh
Somewhere ages and ages hence:
Two roads diverged in a wood, and I-
I took the one less traveled by,
And that has made all the difference.
"""

//You can use the hasPrefix(_:) and hasSuffix(_:) methods for quick testing in strings:
let prefixArray = ["Test 1 - Part 1", "Test 1 - Part 2", "Test 2 - Part 1"]

var count = 0
for test in prefixArray {
    if test.hasPrefix("Test 1 ") {
        count += 1
    }
}

// ENUMERATIONS
// Multiple cases can appear on a single line, separated by commas:
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
