import UIKit

func gcd(_ arr: [Int], count: Int) {
    
}

func gcdTwo(_ num1: Int, _ num2: Int) -> Int {
    let r = num1 % num2
    print("num1: \(num1)")
    print("num2: \(num2)")
    print("r: \(r)")
    
    if r != 0 {
        return gcdTwo(num2, r)
    }else {
        return num2
    }
}

func get() {
    let d = gcdTwo(4, 10)
    
    print(d)
}


get()
