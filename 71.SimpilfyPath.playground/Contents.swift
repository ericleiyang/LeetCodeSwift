import UIKit

struct Stack<T: Comparable> {
    var datas: [T] = []
    
    func peek() -> T? {
        return datas.first
    }
    
    mutating func pop() -> T? {
        guard datas.count > 0 else {return nil}
        return datas.removeFirst()
    }
    
    mutating func push(_ data: T) {
        datas.insert(data, at: 0)
    }
    

}

func simplifyPath(_ path: String) -> String {
    let strArray = path.split(separator: "/")
    
    var stack = Stack<String>()
    for str in strArray {
        if str == ".." {
            stack.pop()
        }else if str == "." {
            continue
        }else {
            stack.push(String(str))
        }
    }
    
    
    var path = ""
    while stack.peek() {
        if let data = stack.pop() {
            path = "/\(data)".appending(path)
        }
    }
    
    return path == "" ? "/" : path
    
}


simplifyPath("/../")

