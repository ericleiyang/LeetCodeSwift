import Foundation

func merge(_ arr: inout [Int], left: Int, middle: Int, right: Int) {
    let n1 = middle - left + 1
    let n2 = right - middle
    
    var temp1 = [Int]()
    var temp2 = [Int]()
    
    for var i in 0..<n1 {
        temp1.append(arr[left + i])
        i += 1
    }
    
    for var j in 0..<n2 {
        temp2.append(arr[middle + 1 + j])
        j += 1
    }
    var i = 0
    var j = 0
    var k = left
    while i < n1 && j < n2 {
        if temp1[i] < temp2[j] {
            arr[k] = temp1[i]
            i += 1
        }else {
            arr[k] = temp2[j]
            j += 1
        }
        k += 1
    }
    
    while i < n1 {
        arr[k] = temp1[i]
        i += 1
        k += 1
    }
    
    while j < n2 {
        arr[k] = temp2[j]
        j += 1
        k += 1
    }
}

func sort(_ arr: inout [Int], left: Int, right: Int) {
    if left < right {
        let middle = (left + right) / 2
        sort(&arr, left: left, right: middle)
        sort(&arr, left: middle + 1, right: right)
        merge(&arr, left: left, middle: middle, right: right)
    }
}

func mergeSort(_ arr: [Int]) -> [Int] {
    var temp = arr
    sort(&temp, left: 0, right: temp.count - 1)
    return temp
}

mergeSort([1,4,3,2,5,6])
