// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/minimum-window-substring/
 76. Minimum Window Substring
 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

 Example:

 Input: S = "ADOBECODEBANC", T = "ABC"
 Output: "BANC"
 Note:

 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 */

class P76: XCTestCase {

    func minWindow(_ s: String, _ t: String) -> String {
        var target: [Character: Int] = [:]
        for c in t {
            target[c, default: 0] += 1
        }
        
        let chars = Array(s)
        var window: [Character: Int] = [:]
        var minLen = Int.max
        var start = 0
        var i = 0, j = 0
        var matchCount = 0
        while j < chars.count {
            if target[chars[j]] != nil {
                window[chars[j], default: 0] += 1
                if window[chars[j]] == target[chars[j]] {
                    matchCount += 1
                }
            }
            j += 1
            
            while matchCount == target.count {
                if j - i < minLen {
                    start = i
                    minLen = j - i
                }
                if target[chars[i]] != nil {
                    window[chars[i], default: 0] -= 1
                    if window[chars[i], default: 0] < target[chars[i]]! {
                        matchCount -= 1
                    }
                }
                i += 1
            }
        }
        return minLen == Int.max ? "" : String(chars[start..<start + minLen])
    }
    
    // use array instead of hashmap which is faster
    func minWindow2(_ s: String, _ t: String) -> String {
        var target = Array(repeating: 0, count: 128)
        let targetAscii = Array(t.utf8).map({ Int($0) })
        let targetCount = Set(Array(t)).count
        for ascii in targetAscii {
            target[ascii] += 1
        }
        
        var window = Array(repeating: 0, count: 128)
        let chars = Array(s.utf8).map { Int($0) }
        var minLen = Int.max
        var start = 0
        var i = 0, j = 0
        var matchCount = 0
        while j < chars.count {
            let ch = chars[j]
            if target[ch] > 0 {
                window[ch] += 1
                matchCount += target[ch] == window[ch] ? 1 : 0
            }
            j += 1
                        
            while matchCount == targetCount {
                if j - i < minLen {
                    start = i
                    minLen = j - i
                }
                let ch = chars[i]
                if target[ch] > 0 {
                    window[ch] -= 1
                    matchCount -= window[ch] < target[ch] ? 1 : 0
                }
                i += 1
            }
        }
        if minLen == Int.max {
            return ""
        }
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(startIndex, offsetBy:minLen - 1)
        return String(s[startIndex...endIndex])
    }
    
    func testMinWindow() {
        XCTAssertEqual(minWindow("", "ABC"), "")
        XCTAssertEqual(minWindow("A", "B"), "")
        XCTAssertEqual(minWindow("AAB", "AB"), "AB")
        XCTAssertEqual(minWindow("ADOBECODEBANC", "ABC"), "BANC")
    }
    
    func testMinWindow2() {
        XCTAssertEqual(minWindow2("", "ABC"), "")
        XCTAssertEqual(minWindow2("A", "B"), "")
        XCTAssertEqual(minWindow2("AAB", "AB"), "AB")
    }

}
