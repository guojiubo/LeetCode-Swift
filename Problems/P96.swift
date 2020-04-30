// Created on 2020/4/14

import XCTest

/*
 https://leetcode-cn.com/problems/unique-binary-search-trees/
 96. Unique Binary Search Trees
 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

 Example:

 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 */

class P96: XCTestCase {

    // dp[0] = 1                          // one empty tree
    // dp[1] = dp[0] * dp[0]
    // dp[2] = dp[0] * dp[1] + dp[1] * dp[0]
    // dp[3] = dp[0] * dp[2] + dp[1] * dp[1] + dp[2] * dp[0]
    // ...
    // dp[i] = dp[0] * dp[i - 1] + dp[1] * dp[i - 2] + ... + dp[i - 1] * dp[0]
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 1...n {
            for j in 0...i - 1 {
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        return dp[n]
    }
    
    func testNumTrees() {
        XCTAssertEqual(numTrees(3), 5)
    }

}
