import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxlen = 0
    var currentlen = 0
    var indHash = [Character: Int]()
    var leftside = -1
    let ls = s.count
    
    for (index, ch) in s.enumerated() {
        if let cachedIndex = indHash[ch], leftside < cachedIndex {
            leftside = cachedIndex
        }
        currentlen = index - leftside

        if currentlen > maxlen {
            maxlen = currentlen
        }
        indHash[ch] = index
    }
    
    currentlen = ls - leftside - 1
    if currentlen > maxlen {
        maxlen = currentlen
    }

    return maxlen
}

lengthOfLongestSubstring("bbbbb")
