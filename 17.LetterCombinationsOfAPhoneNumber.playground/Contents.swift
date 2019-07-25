import Foundation

let stringMap = [
    "2": "abc",
    "3": "def",
    "4": "ghi",
    "5": "jkl",
    "6": "mno",
    "7": "pqrs",
    "8": "tuv",
    "9": "wxyz"
]

var result = [String]()
func letterCombinations(_ digits: String) -> [String] {
    guard digits.count > 0 else { return [String]() }
    let combination = ""
    recursiveLoop(combination, digits)
    
    return result
}

func recursiveLoop(_ combination: String, _ digits: String) {
    if digits.count == 0 {
        result.append(combination)
        return
    }
    if let d = digits.first, let value = stringMap[String(d)]{
        for s in value {
            recursiveLoop(combination.appending(String(s)), String(digits.dropFirst()))
        }
    }
}

letterCombinations("234")

