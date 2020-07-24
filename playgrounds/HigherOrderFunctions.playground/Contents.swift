import UIKit

let numbers = [1, 2, 3, 4, 3, 3]

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





// 3 sum [1, 2, 3, 4] using reduce

