// Created on 2020/4/20

import XCTest

/*
 https://leetcode-cn.com/problems/house-robber/
 198. House Robber
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

 Example 1:

 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
              Total amount you can rob = 1 + 3 = 4.
 Example 2:

 Input: [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
              Total amount you can rob = 2 + 9 + 1 = 12.
 */

class P198: XCTestCase {

    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var dp = nums
        for i in stride(from: 1, to: nums.count, by: 1) {
            dp[i] = max(dp[i - 1], i > 1 ? dp[i - 2] + nums[i] : nums[i])
        }
        return dp[nums.count - 1]
    }
    
    func rob2(_ nums: [Int]) -> Int {
        var first = 0, second = 0
        for i in 0..<nums.count {
            let curr = max(first + nums[i], second)
            first = second
            second = curr
        }
        return second
    }
    
    func testRob() {
        XCTAssertEqual(rob([]), 0)
        XCTAssertEqual(rob([1,2]), 2)
        XCTAssertEqual(rob([1,2,3,1]), 4)
        XCTAssertEqual(rob([2,7,9,3,1]), 12)
    }
    
    func testRob2() {
        XCTAssertEqual(rob2([]), 0)
        XCTAssertEqual(rob2([1,2]), 2)
        XCTAssertEqual(rob2([1,2,3,1]), 4)
        XCTAssertEqual(rob2([2,7,9,3,1]), 12)
    }

}
