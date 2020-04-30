// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/jump-game-ii/
 45. Jump Game II
 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Your goal is to reach the last index in the minimum number of jumps.

 Example:

 Input: [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2.
     Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Note:

 You can assume that you can always reach the last index.
 */

class P45: XCTestCase {

    // https://leetcode-cn.com/problems/jump-game-ii/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-10/
    func jump(_ nums: [Int]) -> Int {
        var end = 0
        var maxPosition = 0
        var steps = 0
        for i in stride(from: 0, to: nums.count - 1, by: 1) {
            maxPosition = max(maxPosition, nums[i] + i)
            if i == end {
                steps += 1
                end = maxPosition
            }
        }
        return steps
    }
    
    func testJump() {
        XCTAssertEqual(jump([]), 0)
        XCTAssertEqual(jump([2,3,1,1,4]), 2)
    }

}
