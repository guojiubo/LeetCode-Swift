// Created on 2020/4/23

import XCTest

/*
 https://leetcode-cn.com/problems/coin-change/
 322. Coin Change
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 Example 1:

 Input: coins = [1, 2, 5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:

 Input: coins = [2], amount = 3
 Output: -1
 Note:
 You may assume that you have an infinite number of each kind of coin.
 */

class P322: XCTestCase {

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        let impossible = amount + 1
        var dp = Array(repeating: impossible, count: amount + 1)
        dp[0] = 0
        
        for i in stride(from: 1, through: amount, by: 1) {
            for coin in coins where i >= coin && dp[i - coin] != impossible {
                dp[i] = min(dp[i], 1 + dp[i - coin])
            }
        }
        
        return dp[amount] == impossible ? -1 : dp[amount]
    }
    
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        var memo = Array(repeating: 0, count: amount + 1)

        func dfs(_ amount: Int) -> Int {
            if amount == 0 {
                return 0
            }
            if amount < 0 {
                return -1
            }
            if memo[amount] != 0 {
                return memo[amount]
            }
            var count = Int.max
            for coin in coins {
                let ret = dfs(amount - coin)
                if ret >= 0 && ret < count {
                    count = ret + 1
                }
            }
            memo[amount] = count == Int.max ? -1 : count
            return memo[amount]
        }
        
        return dfs(amount)
    }
    
    func testCoinChange() {
        XCTAssertEqual(coinChange([1, 2, 5], 11), 3)
        XCTAssertEqual(coinChange([2], 3), -1)
    }
    
    func testCoinChange2() {
        XCTAssertEqual(coinChange2([1, 2, 5], 11), 3)
        XCTAssertEqual(coinChange2([2], 3), -1)
    }

}
