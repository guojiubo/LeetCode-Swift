// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/longest-palindromic-substring/
 5. Longest Palindromic Substring
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example 1:

 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:

 Input: "cbbd"
 Output: "bb"
 */

class P5: XCTestCase {
    
    // expand around center
    // T: O(n^2), S: O(1)
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let chars = Array(s)
        
        func expandAroundCenter(_ left: Int, _ right: Int) -> Int {
            var left = left, right = right
            while left >= 0 && right < chars.count && chars[left] == chars[right] {
                left -= 1
                right += 1
            }
            return right - left - 1
        }
        
        var start = 0, end = 0
        for i in 0..<chars.count {
            let len1 = expandAroundCenter(i, i)         // aba
            let len2 = expandAroundCenter(i, i + 1)     // abba
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        
        return String(chars[start...end])
    }
    
    func longestPalindrome2(_ s: String) -> String {
        let s = Array(s)
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        
        var longest = 0
        var result = ""
        for j in 0..<s.count {
            for i in 0...j {
                if s[i] == s[j] && (j - i <= 2 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                    
                    if j - i + 1 > longest {
                        longest = j - i + 1
                        result = String(s[i...j])
                    }
                }
            }
        }
        return result
    }
    
    func testLongestPalindrome() {
        XCTAssert(longestPalindrome("abba") == "abba")
        XCTAssert(longestPalindrome("cbbd") == "bb")
    }
    
    func testLongestPalindrome2() {
        XCTAssert(longestPalindrome2("a") == "a")
        XCTAssert(longestPalindrome2("abba") == "abba")
        XCTAssert(longestPalindrome2("cbbd") == "bb")
    }

}
