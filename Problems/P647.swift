// Created on 2020/4/29

import XCTest

/*
 https://leetcode-cn.com/problems/palindromic-substrings/
 647. Palindromic Substrings
 Given a string, your task is to count how many palindromic substrings in this string.

 The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

 Example 1:

 Input: "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
  

 Example 2:

 Input: "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
  

 Note:

 The input string length won't exceed 1000.
 */

class P647: XCTestCase {

    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        var dp = Array(repeating: Array(repeating: false, count: chars.count), count: chars.count)
        
        for j in 0..<chars.count {
            for i in 0...j {
                dp[i][j] = chars[i] == chars[j] && (j - i <= 1 || dp[i + 1][j - 1])
                count += dp[i][j] ? 1 : 0
            }
        }
        
        return count
    }
    
    func countSubstrings2(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        
        func expandAroundCenter(_ left: Int, _ right: Int) {
            var left = left, right = right
            while left >= 0 && right < chars.count && chars[left] == chars[right] {
                count += 1
                left -= 1
                right += 1
            }
        }
        
        for i in 0..<chars.count {
            expandAroundCenter(i, i)
            expandAroundCenter(i, i + 1)
        }
        
        return count
    }
    
    func testCountSubstrings() {
        XCTAssertEqual(countSubstrings("abc"), 3)
        XCTAssertEqual(countSubstrings("aaa"), 6)
    }
    
    func testCountSubstrings2() {
        XCTAssertEqual(countSubstrings2("abc"), 3)
        XCTAssertEqual(countSubstrings2("aaa"), 6)
    }

}
