// Created on 2020/4/23

import XCTest

/*
 https://leetcode-cn.com/problems/partition-equal-subset-sum/
 416. Partition Equal Subset Sum
 Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

 Note:

 Each of the array element will not exceed 100.
 The array size will not exceed 200.
  

 Example 1:

 Input: [1, 5, 11, 5]

 Output: true

 Explanation: The array can be partitioned as [1, 5, 5] and [11].
  

 Example 2:

 Input: [1, 2, 3, 5]

 Output: false

 Explanation: The array cannot be partitioned into equal sum subsets.
 */

class P416: XCTestCase {

    // dp[i][j]: whether elements in nums[0...i] can form the sum of j
    // dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i]]
    func canPartition(_ nums: [Int]) -> Bool {
        if nums.count < 2 { return false }
        let sum = nums.reduce(0, +)
        if sum % 2 != 0 { return false }
        
        let target = sum / 2
        var dp = Array(repeating: Array(repeating: false, count: target + 1), count: nums.count)
        
        for j in 0...target {
            dp[0][j] = nums[0] == j
        }
        
        for i in 1..<nums.count {
            for j in 0...target {
                if j >= nums[i] {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i]]
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[nums.count - 1][target]
    }
    
    func canPartition2(_ nums: [Int]) -> Bool {
        if nums.count < 2 { return false }
        let sum = nums.reduce(0, +)
        if sum % 2 != 0 { return false }
        
        let target = sum / 2
        var dp = Array(repeating: false, count: target + 1)
        
        dp[nums[0]] = true
        
        for i in 1..<nums.count {
            for j in stride(from: target, through: 0, by: -1) {
                if j < nums[i] {
                    break
                }
                dp[j] = dp[j] || dp[j - nums[i]]
            }
        }
        
        return dp[target]
    }
    
    func testCanPartition() {
        XCTAssertTrue(canPartition([1, 5, 11, 5]))
        XCTAssertFalse(canPartition([1, 2, 3, 5]))
    }
    
    func testCanPartition2() {
        XCTAssertTrue(canPartition2([1, 5, 11, 5]))
        XCTAssertFalse(canPartition2([1, 2, 3, 5]))
        XCTAssertFalse(canPartition2([1, 2, 5]))
    }

}
