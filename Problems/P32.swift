// Created on 2020/4/8

import XCTest

/*
 https://leetcode-cn.com/problems/longest-valid-parentheses/
 32. Longest Valid Parentheses
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 Example 1:

 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 Example 2:

 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"
 */

class P32: XCTestCase {

    // dp[i]: length of longest valid parentheses that end with s[i]
    func longestValidParentheses(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let chars = Array(s)
        var dp = Array(repeating: 0, count: s.count)
        var longest = 0
        for i in 1..<chars.count {
            if chars[i] == ")" {
                if chars[i - 1] == "(" {
                    dp[i] = 2 + (i > 1 ? dp[i - 2] : 0)
                } else {
                    // (  )  (  (  )  )
                    //       ^        ^
                    //      prev      i
                    let prev = i - dp[i - 1] - 1
                    if prev >= 0 && chars[prev] == "(" {
                        dp[i] = 2 + dp[i - 1] + (prev > 0 ? dp[prev - 1] : 0)
                    }
                }
                longest = max(longest, dp[i])
            }
        }
        return longest
    }
    
    func testLongestValidParentheses() {
        XCTAssert(longestValidParentheses("(()") == 2)
        XCTAssert(longestValidParentheses(")()())") == 4)
        XCTAssert(longestValidParentheses("()") == 2)
        XCTAssert(longestValidParentheses("(") == 0)
        XCTAssert(longestValidParentheses("()(())") == 6)
    }

}
