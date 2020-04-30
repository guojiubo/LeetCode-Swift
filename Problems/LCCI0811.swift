// Created on 2020/4/23

import XCTest

/*
 https://leetcode-cn.com/problems/coin-lcci/
 面试题 08.11. Coin LCCI
 Given an infinite number of quarters (25 cents), dimes (10 cents), nickels (5 cents), and pennies (1 cent), write code to calculate the number of ways of representing n cents. (The result may be large, so you should return it modulo 1000000007)

 Example1:

  Input: n = 5
  Output: 2
  Explanation: There are two ways:
 5=5
 5=1+1+1+1+1
 Example2:

  Input: n = 10
  Output: 4
  Explanation: There are four ways:
 10=10
 10=5+5
 10=5+1+1+1+1+1
 10=1+1+1+1+1+1+1+1+1+1
 Notes:

 You can assume:

 0 <= n <= 1000000
 */

class LCCI0811: XCTestCase {

    func waysToChange(_ n: Int) -> Int {
        let coins = [1, 5, 10, 25]
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: coins.count)
        
        for j in 0...n {
            dp[0][j] = 1
        }
        for i in 0..<coins.count {
            dp[i][0] = 1
        }
        
        for i in 1..<coins.count {
            for j in stride(from: 1, through: n, by: 1) {
                if j >= coins[i] {
                    dp[i][j] = (dp[i - 1][j] + dp[i][j - coins[i]]) % 1000000007
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[3][n]
    }
    
    func waysToChange2(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1

        let coins = [1, 5, 10, 25]
        for coin in coins {
            for i in stride(from: coin, through: n, by: 1) {
                dp[i] = (dp[i] + dp[i - coin]) % 1000000007
            }
        }
        return dp[n]
    }
    
    func testWaysToChange() {
        XCTAssertEqual(waysToChange(0), 1)
        XCTAssertEqual(waysToChange(5), 2)
        XCTAssertEqual(waysToChange(10), 4)
        XCTAssertEqual(waysToChange(50), 49)
    }

}
