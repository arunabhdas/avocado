import UIKit

let numbers = [1, 2, 3, 4, 3, 3]
let allnumbers = [1, 2, 3, 4, 5, 6]

// 1 filter into [3, 3, 3] then filter into [2, 4] (even)

/*
var filteredArray = [Int]()

for number in numbers {
    if number == 3 {
        filteredArray.append(number)
    }
}

print(filteredArray)
*/

let filtered = numbers.filter( { return $0 % 2 == 0})


print(filtered)


// 2 transform [1, 2, 3, 4] -> [2, 4, 6, 8] using map
/*
var transformedArray = [Int]()

for number in [1, 2, 3, 4] {
    transformedArray.append(number * 2)
}

print(transformedArray)
*/

let transformed = numbers.map({ return $0 * 2 })

print(transformed)






// 3 sum [1, 2, 3, 4, 5, 6] using reduce

/*
var sumElements = 0

for number in allnumbers {
    sumElements += number
}

print(sumElements)
*/

let sum = allnumbers.reduce(0, {sum, number in sum + number})

print(sum)



