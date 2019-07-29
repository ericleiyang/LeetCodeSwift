import Foundation

func partition(_ arr: inout [Int], left: Int, right: Int) -> Int {
    let value = arr[right]
    var i = left - 1
    for var j in left...right {
        if arr[j] < value {
            i += 1
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
        }
        j += 1
    }
    
    let temp = arr[i+1]
    arr[i+1] = value
    arr[right] = temp
    
    return i + 1
}

func sort(_ arr: inout [Int], left: Int, right: Int) {
    if left < right {
        let index = partition(&arr, left: left, right: right)
        sort(&arr, left: left, right: index - 1)
        sort(&arr, left: index + 1 , right: right)
    }
}

func quickSort(_ arr: [Int]) -> [Int] {
    var temp = arr
    sort(&temp, left: 0, right: arr.count - 1)
    return temp
}

quickSort([1,8,7,5,3,9])
