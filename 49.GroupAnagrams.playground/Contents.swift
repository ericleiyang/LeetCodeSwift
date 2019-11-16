import UIKit


func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict: [[Character]: [String]] = [:]
    
    for str in strs {
        let key = str.sorted()
        if var arr = dict[key] {
            arr.append(str)
            dict[key] = arr
        }else {
            let arr:[String] = [str]
            dict[key] = arr
        }
    }
    
    let keys = Array(dict.keys)
    var temp:[[String]] = []
    for key in keys {
        temp.append(dict[key]!)
    }
    return temp
}

groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
