// Created on 2020/4/3

import XCTest

/*
 https://leetcode-cn.com/problems/edit-distance/
 72. Edit Distance
 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.

 You have the following 3 operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
 Example 1:

 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:

 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 */

class P72: XCTestCase {

    // assume we are changing word1 only, word2 stays untouched
    // up -> bottom
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let chars1 = Array(word1), chars2 = Array(word2)
        var memo = Array(repeating: Array(repeating: -1, count: word2.count), count: word1.count)
        
        func edit(_ i: Int, _ j: Int) -> Int {
            if i < 0 { return j + 1 }
            if j < 0 { return i + 1 }
            
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            
            if chars1[i] == chars2[j] {
                memo[i][j] = edit(i - 1, j - 1)
            } else {
                memo[i][j] = 1 + min(
                    edit(i, j - 1),         // insert
                    edit(i - 1, j),         // delete
                    edit(i - 1, j - 1)      // replace
                )
            }
            return memo[i][j]
        }
        
        return edit(word1.count - 1, word2.count - 1)
    }
    
    // bottom -> up
    func minDistance2(_ word1: String, _ word2: String) -> Int {
        let chars1 = Array(word1), chars2 = Array(word2)
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        
        for i in 0...word1.count {
            for j in 0...word2.count {
                if i == 0 && j == 0 {
                    dp[i][j] = 0
                } else if i == 0 {
                    dp[i][j] = 1 + dp[i][j - 1]
                } else if j == 0 {
                    dp[i][j] = 1 + dp[i - 1][j]
                } else {
                    if chars1[i - 1] == chars2[j - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else {
                        dp[i][j] = 1 + min(
                            dp[i][j - 1],       // insert
                            dp[i - 1][j],       // delete
                            dp[i - 1][j - 1]    // replace
                        )
                    }
                }
            }
        }
        
        return dp[word1.count][word2.count]
    }
    
    func testMinDistance() {
        XCTAssert(minDistance("horse", "ros") == 3)
        XCTAssert(minDistance("intention", "execution") == 5)
    }
    
    func testMinDistance2() {
        XCTAssert(minDistance2("horse", "ros") == 3)
        XCTAssert(minDistance2("intention", "execution") == 5)
    }

}
