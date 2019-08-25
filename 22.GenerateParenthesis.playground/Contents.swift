import UIKit

func generateParenthesis(_ n: Int) -> [String] {
    var head = [String]()
    recursivlyCall(&head, string: "", open: 0, close: 0, max: n)
    
    print(head)
    return head
}

func recursivlyCall(_ list: inout [String], string: String,  open: Int, close: Int, max: Int) {
    if string.count == max * 2 {
        list.append(string)
        return
    }
    
    if open < max {
        recursivlyCall(&list, string: string.appending("("), open: open + 1, close: close, max: max)
    }
    
    if close < open {
        recursivlyCall(&list, string: string.appending(")"), open: open, close: close + 1, max: max)
    }
}

generateParenthesis(6)
