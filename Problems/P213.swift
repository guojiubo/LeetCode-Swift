// Created on 2020/4/21

import XCTest

/*
 https://leetcode-cn.com/problems/house-robber-ii/
 213. House Robber II
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

 Example 1:

 Input: [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
              because they are adjacent houses.
 Example 2:

 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
              Total amount you can rob = 1 + 3 = 4.
 */

class P213: XCTestCase {

    // rob from [first...last - 1] or rob from [second...last]
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }
        
        var dp1 = Array(repeating: 0, count: nums.count)
        dp1[0] = nums[0]
        dp1[1] = nums[0]    // rob first house
        
        var dp2 = Array(repeating: 0, count: nums.count)
        dp2[0] = 0
        dp2[1] = nums[1]    // rob second house
        
        for i in 2..<nums.count {
            dp1[i] = max(dp1[i - 1], nums[i] + dp1[i - 2])
            dp2[i] = max(dp2[i - 1], nums[i] + dp2[i - 2])
        }
        
        return max(dp1[dp1.count - 2],  // rob until second last house
                   dp2[dp2.count - 1])  // rob until last house
    }
    
    // S: O(1)
    func rob2(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }

        var a = nums[0], b = nums[0]
        var x = 0, y = nums[1]
        
        for i in 2..<nums.count {
            let c = max(b, nums[i] + a)
            a = b
            b = c
            
            let z = max(y, nums[i] + x)
            x = y
            y = z
        }
        
        return max(a, y)
    }
    
    func testRob() {
        XCTAssertEqual(rob([2,3,2]), 3)
        XCTAssertEqual(rob([1,2,3,1]), 4)
    }
    
    func testRob2() {
        XCTAssertEqual(rob2([2,3,2]), 3)
        XCTAssertEqual(rob2([1,2,3,1]), 4)
    }

}
