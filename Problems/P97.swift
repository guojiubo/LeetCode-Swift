// Created on 2020/4/3

import XCTest

/*
 https://leetcode-cn.com/problems/interleaving-string/
 97. Interleaving String
 Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

 Example 1:

 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 Output: true
 Example 2:

 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 Output: false
 */

class P97: XCTestCase {

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count { return false }
        
        let chars1 = Array(s1), chars2 = Array(s2), chars3 = Array(s3)
        var dp = Array(repeating: Array(repeating: false, count: chars2.count + 1), count: chars1.count + 1)
        for i in 0...chars1.count {
            for j in 0...chars2.count {
                if i == 0 && j == 0 {
                    dp[i][j] = true
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1] && chars3[i + j - 1] == chars2[j - 1]
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j] && chars3[i + j - 1] == chars1[i - 1]
                } else {
                    dp[i][j] = dp[i - 1][j] && chars3[i + j - 1] == chars1[i - 1] || dp[i][j - 1] && chars3[i + j - 1] == chars2[j - 1]
                }
            }
        }
        return dp[chars1.count][chars2.count]
    }
    
    func testIsInterleave() {
        XCTAssert(isInterleave("a", "", "c") == false)
        XCTAssert(isInterleave("a", "b", "ab"))
        XCTAssert(isInterleave("aabcc", "dbbca", "aadbbcbcac"))
        XCTAssert(isInterleave("aabcc", "dbbca", "aadbbbaccc") == false)
    }

}
