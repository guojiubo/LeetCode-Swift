// Created on 2020/4/20

import XCTest

/*
 https://leetcode-cn.com/problems/rotate-array/
 189. Rotate Array
 Given an array, rotate the array to the right by k steps, where k is non-negative.

 Example 1:

 Input: [1,2,3,4,5,6,7] and k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: [-1,-100,3,99] and k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 Note:

 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 */

class P189: XCTestCase {
    
    func reverseBetween(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var i = start, j = end
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        if k == 0 || k == nums.count {
            return
        }
        reverseBetween(&nums, 0, nums.count - 1)
        reverseBetween(&nums, 0, k - 1)
        reverseBetween(&nums, k, nums.count - 1)
    }
    
    func testRotate() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        rotate(&nums, 3)
        XCTAssertEqual(nums.description, "[5, 6, 7, 1, 2, 3, 4]")
    }

}
