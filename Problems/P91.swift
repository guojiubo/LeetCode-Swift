// Created on 2020/4/14

import XCTest

/*
 https://leetcode-cn.com/problems/decode-ways/
 91. Decode Ways
 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.

 Example 1:

 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:

 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 */

class P91: XCTestCase {

    // T: O(N), S: O(N)
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty || s.starts(with: "0") { return 0 }
        
        let nums = s.map { Int(String($0))! }
        var dp = Array(repeating: 0, count: s.count)
        dp[0] = 1
        for i in stride(from: 1, to: nums.count, by: 1) {
            if nums[i] == 0 {
                if nums[i - 1] == 0 || nums[i - 1] > 2 {
                    return 0
                } else {
                    dp[i] = i > 1 ? dp[i - 2] : 1
                }
            } else if nums[i - 1] == 0 {
                dp[i] = dp[i - 2]
            } else {
                let num = nums[i - 1] * 10 + nums[i]
                if num > 26 {
                    dp[i] = dp[i - 1]
                } else {
                    dp[i] = dp[i - 1] + (i > 1 ? dp[i - 2] : 1)
                }
            }
        }
        return dp[nums.count - 1]
    }
    
    // T: O(N), S: O(1)
    func numDecodings2(_ s: String) -> Int {
        if s.isEmpty || s.starts(with: "0") { return 0 }
        
        let nums = s.map { Int(String($0))! }
        
        var first = 1, second = 1
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            var curr = 0
            if nums[i] == 0 {
                if nums[i - 1] == 0 || nums[i - 1] > 2 {
                    return 0
                } else {
                    curr = i > 1 ? first : 1
                }
            } else if nums[i - 1] == 0 {
                curr = first
            } else {
                let num = nums[i - 1] * 10 + nums[i]
                if num > 26 {
                    curr = second
                } else {
                    curr = second + (i > 1 ? first : 1)
                }
            }
            first = second
            second = curr
        }
        return second
    }
    
    func testNumDecodings() {
        XCTAssertEqual(numDecodings("10"), 1)
        XCTAssertEqual(numDecodings("12"), 2)
        XCTAssertEqual(numDecodings("1123125116"), 45)
    }
    
    func testNumDecodings2() {
        XCTAssertEqual(numDecodings2("10"), 1)
        XCTAssertEqual(numDecodings2("12"), 2)
        XCTAssertEqual(numDecodings2("1123125116"), 45)
    }

}
