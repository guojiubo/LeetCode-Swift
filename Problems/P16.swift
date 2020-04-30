// Created on 2020/4/6

import XCTest

/*
 https://leetcode-cn.com/problems/3sum-closest/
 16. 3Sum Closest
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

 Example:

 Given array nums = [-1, 2, 1, -4], and target = 1.

 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

class P16: XCTestCase {

    // sort
    // stick first number, which is nums[i]
    // move two pointer j & k to get closer to target
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        var closest = nums[0] + nums[1] + nums[2]
        for i in 0..<nums.count - 2 {
            var j = i + 1, k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if abs(sum - target) < abs(closest - target) {
                    closest = sum
                }
                if sum == target {
                    return sum
                } else if sum < target {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return closest
    }
    
    func testThreeSumClosest() {
        XCTAssert(threeSumClosest([0, 2, 1, -3], 1) == 0)
        XCTAssert(threeSumClosest([-1, 2, 1, -4], 1) == 2)
    }

}
