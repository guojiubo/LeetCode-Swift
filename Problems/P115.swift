// Created on 2020/4/15

import XCTest

/*
 https://leetcode-cn.com/problems/distinct-subsequences/
 115. Distinct Subsequences
 Given a string S and a string T, count the number of distinct subsequences of S which equals T.

 A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ACE" is a subsequence of "ABCDE" while "AEC" is not).

 It's guaranteed the answer fits on a 32-bit signed integer.

 Example 1:

 Input: S = "rabbbit", T = "rabbit"
 Output: 3
 Explanation:
 As shown below, there are 3 ways you can generate "rabbit" from S.
 (The caret symbol ^ means the chosen letters)

 rabbbit
 ^^^^ ^^
 rabbbit
 ^^ ^^^^
 rabbbit
 ^^^ ^^^
 Example 2:

 Input: S = "babgbag", T = "bag"
 Output: 5
 Explanation:
 As shown below, there are 5 ways you can generate "bag" from S.
 (The caret symbol ^ means the chosen letters)

 babgbag
 ^^ ^
 babgbag
 ^^    ^
 babgbag
 ^    ^^
 babgbag
   ^  ^^
 babgbag
     ^^^
 */

class P115: XCTestCase {

    func numDistinct(_ s: String, _ t: String) -> Int {
        let s = Array(s), t = Array(t)
        var memo = Array(repeating: Array(repeating: -1, count: t.count), count: s.count)
        
        func numDistinct(_ i: Int, _ j: Int) -> Int {
            if j < 0 { return 1 }
            if i < 0 { return 0 }
            
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            
            if s[i] != t[j] {
                memo[i][j] = numDistinct(i - 1, j)
            } else {
                memo[i][j] = numDistinct(i - 1, j) + numDistinct(i - 1, j - 1)
            }
            
            return memo[i][j]
        }
        
        return numDistinct(s.count - 1, t.count - 1)
    }
    
    // DP
    // i \ j
    //       blank  b  a  b  g  b  a  g
    // blank     1  1  1  1  1  1  1  1
    // b         0  1  1  2  2  3  3  3
    // a         0  0  1  1  1  1  4  4
    // g         0  0  0  0  1  1  1  5
    func numDistinct2(_ s: String, _ t: String) -> Int {
        let s = Array(s), t = Array(t)
        var dp = Array(repeating: Array(repeating: 0, count: s.count + 1), count: t.count + 1)
        
        for i in 0...t.count {
            for j in 0...s.count {
                if i == 0 {             // order matters
                    dp[i][j] = 1
                } else if j == 0 {
                    dp[i][j] = 0
                } else {
                    if s[j - 1] != t[i - 1] {
                        dp[i][j] = dp[i][j - 1]
                    } else {
                        dp[i][j] = dp[i][j - 1] + dp[i - 1][j - 1]
                    }
                }
            }
        }
        
        return dp[t.count][s.count]
    }
    
    func testNumDistinct() {
        XCTAssertEqual(numDistinct("rabbbit", "rabbit"), 3)
        XCTAssertEqual(numDistinct("babgbag", "bag"), 5)
    }
    
    func testNumDistinct2() {
        XCTAssertEqual(numDistinct2("rabbbit", "rabbit"), 3)
        XCTAssertEqual(numDistinct2("babgbag", "bag"), 5)
    }

}
