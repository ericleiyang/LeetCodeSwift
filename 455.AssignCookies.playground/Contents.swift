import UIKit

func merge(arr: inout [Int], left: Int, middle: Int, right: Int) {
    var leftArr: [Int] = []
    var rightArr: [Int] = []

    var leftCount = 0
    for i in left...middle {
        leftArr.append(arr[i])
        leftCount += 1
    }

    print(leftArr)
    
    var rightCount = 0
    for j in middle + 1...right{
        rightArr.append(arr[j])
        rightCount += 1
    }

    print(rightArr)
    
    var i = 0
    var j = 0
    var k = left
    
    while i < leftCount, j < rightCount {
        if leftArr[i] < rightArr[j] {
            arr[k] = leftArr[i]
            i += 1
        }else {
            arr[k] = rightArr[j]
            j += 1
        }
        k += 1
    }
    
    while i < leftCount {
        arr[k] = leftArr[i]
        i += 1
        k += 1
    }
    
    while j < rightCount {
        arr[k] = rightArr[j]
        j += 1
        k += 1
    }
}

func mergeSort(arr: inout [Int], left: Int, right: Int) {
    if left < right {
        let middle = (right + left) / 2
        mergeSort(arr: &arr, left: left, right: middle)
        mergeSort(arr: &arr, left: middle + 1, right: right)
        merge(arr: &arr, left: left, middle: middle, right: right)
    }
}

func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var tempG = g
    var tempS = s
    mergeSort(arr: &tempG, left: 0, right: g.count - 1)
    mergeSort(arr: &tempS, left: 0, right: s.count - 1)
    
    var count = 0
    var i = 0
    var j = 0
    print(tempS)
    print(tempG)
    while i < tempG.count, j < tempS.count {
        if tempS[j] >= tempG[i] {
            print(tempS[j])
            print(tempG[i])
            count += 1
            i += 1
        }
        j += 1
    }

    return count
}

findContentChildren([10,9,8,7], [5,6,7,8])
