// Created on 2020/4/23

import XCTest

/*
 https://leetcode-cn.com/problems/target-sum/
 494. Target Sum
 You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

 Find out how many ways to assign symbols to make sum of integers equal to target S.

 Example 1:
 Input: nums is [1, 1, 1, 1, 1], S is 3.
 Output: 5
 Explanation:

 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3

 There are 5 ways to assign symbols to make the sum of nums be target 3.
 Note:
 The length of the given array is positive and will not exceed 20.
 The sum of elements in the given array will not exceed 1000.
 Your output answer is guaranteed to be fitted in a 32-bit integer.
 */

class P494: XCTestCase {

    // dp[i][j] = dp[i - 1][j - nums[i]] + dp[i - 1][j + nums[i]]
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        let sum = nums.reduce(0, +)
        
        if S > sum || S < -sum { return 0 }
        
        var dp = Array(repeating: Array(repeating: 0, count: sum * 2 + 1), count: nums.count)
        
        let offset = sum
        dp[0][nums[0] + offset] = 1
        dp[0][-nums[0] + offset] += 1       // notice here use '+=' instead of '=' in case of nums[0] == 0
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            for j in -sum...sum {
                if j + nums[i] <= sum {
                    dp[i][j + offset] += dp[i - 1][j + nums[i] + offset]
                }
                if j - nums[i] >= -sum {
                    dp[i][j + offset] += dp[i - 1][j - nums[i] + offset]
                }
            }
        }
        
        return dp[nums.count - 1][S + offset]
    }
    
    func testFindTargetSumWays() {
        XCTAssertEqual(findTargetSumWays([1, 1, 1, 1, 1], 3), 5)
        XCTAssertEqual(findTargetSumWays([0,17,5,0,0,18,18,28,36,29,42,4,32,2,5,31,24,30,8,6], 27), 8160)
    }

}
