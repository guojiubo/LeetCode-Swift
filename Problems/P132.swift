// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/palindrome-partitioning-ii/
 132. Palindrome Partitioning II
 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return the minimum cuts needed for a palindrome partitioning of s.

 Example:

 Input: "aab"
 Output: 1
 Explanation: The palindrome partitioning ["aa","b"] could be produced using 1 cut.
 */

class P132: XCTestCase {

    // https://leetcode-cn.com/problems/palindrome-partitioning-ii/solution/dong-tai-gui-hua-by-liweiwei1419-2/
    func minCut(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let s = Array(s)
        
        var palindromes = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        for j in 0..<s.count {
            for i in 0...j {
                if s[i] == s[j] && (j - i < 2 || palindromes[i + 1][j - 1]) {
                    palindromes[i][j] = true
                }
            }
        }
        
        var dp = Array(repeating: 0, count: s.count)
        for i in 0..<dp.count {
            dp[i] = i
        }
        
        for i in stride(from: 1, to: s.count, by: 1) {
            if palindromes[0][i] {
                dp[i] = 0
            } else {
                for j in 0..<i {
                    if palindromes[j + 1][i] {
                        dp[i] = min(dp[j] + 1, dp[i])
                    }
                }
            }
        }
        return dp[s.count - 1]
    }
    
    func testMinCut() {
        XCTAssertEqual(minCut(""), 0)
        XCTAssertEqual(minCut("aab"), 1)
        XCTAssertEqual(minCut("efe"), 0)
    }

}
