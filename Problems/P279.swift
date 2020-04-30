// Created on 2020/4/24

import XCTest

/*
 https://leetcode-cn.com/problems/perfect-squares/
 279. Perfect Squares
 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.

 Example 1:

 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:

 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
 */

class P279: XCTestCase {

    func numSquares(_ n: Int) -> Int {
        var nums: [Int] = []
        var i = 1
        while i * i <= n {
            nums.append(i * i)
            i += 1
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: nums.count)
        
        for j in 0...n {
            dp[0][j] = j
        }
        
        for i in stride(from: 1, through: nums.count - 1, by: 1) {
            for j in 0...n {
                if j >= nums[i] {
                    dp[i][j] = min(dp[i - 1][j], 1 + dp[i][j - nums[i]])
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[nums.count - 1][n]
    }
    
    func numSquares2(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        
        for i in 0...n {
            dp[i] = i
        }
        
        var i = 1
        while i * i <= n {
            for j in i * i...n {
                dp[j] = min(dp[j], 1 + dp[j - i * i])
            }
            i += 1
        }
        
        return dp[n]
    }
    
    func testNumSquares() {
        XCTAssertEqual(numSquares(1), 1)
        XCTAssertEqual(numSquares(12), 3)
        XCTAssertEqual(numSquares(13), 2)
    }
    
    func testNumSquares2() {
        XCTAssertEqual(numSquares2(1), 1)
        XCTAssertEqual(numSquares2(12), 3)
        XCTAssertEqual(numSquares2(13), 2)
    }

}
