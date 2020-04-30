// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/longest-common-prefix/
 14. Longest Common Prefix
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:

 All given inputs are in lowercase letters a-z.
 */

class P14: XCTestCase {

    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var prefix = strs[0]
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                prefix.removeLast()
            }
        }
        return prefix
    }
    
    func longestCommonPrefix2(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        
        func commonPrefix(_ s1: String, _ s2: String) -> String {
            var iterator1 = s1.makeIterator()
            var iterator2 = s2.makeIterator()
            var prefix = ""
            while let char1 = iterator1.next(), let char2 = iterator2.next(), char1 == char2 {
                prefix.append(char1)
            }
            return prefix
        }
        
        var prefix = strs[0]
        for i in 1..<strs.count {
            prefix = commonPrefix(prefix, strs[i])
        }
        return prefix
    }
    
    // Divide and conquer
    func longestCommonPrefix3(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        
        func commonPrefix(_ s1: String, _ s2: String) -> String {
            var iterator1 = s1.makeIterator()
            var iterator2 = s2.makeIterator()
            var prefix = ""
            while let char1 = iterator1.next(), let char2 = iterator2.next(), char1 == char2 {
                prefix.append(char1)
            }
            return prefix
        }
        
        func longestCommonPrefix(_ left: Int, _ right: Int) -> String {
            if left == right {
                return strs[left]
            }
            let mid = left + (right - left) / 2
            let lcpLeft = longestCommonPrefix(left, mid)
            let lcpRight = longestCommonPrefix(mid + 1, right)
            return commonPrefix(lcpLeft, lcpRight)
        }
        
        return longestCommonPrefix(0, strs.count - 1)
    }
    
    func testLongestCommonPrefix() {
        XCTAssert(longestCommonPrefix(["flower","flow","flight"]) == "fl")
        XCTAssert(longestCommonPrefix(["d","racecar","car"]) == "")
    }
    
    func testLongestCommonPrefix2() {
        XCTAssert(longestCommonPrefix2(["flower","flow","flight"]) == "fl")
        XCTAssert(longestCommonPrefix2(["d","racecar","car"]) == "")
    }
    
    func testLongestCommonPrefix3() {
        XCTAssert(longestCommonPrefix3(["flower","flow","flight"]) == "fl")
        XCTAssert(longestCommonPrefix3(["d","racecar","car"]) == "")
    }

}
