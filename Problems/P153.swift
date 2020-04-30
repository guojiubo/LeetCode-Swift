// Created on 2020/4/27

import XCTest

/*
 https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/
 153. Find Minimum in Rotated Sorted Array
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.

 You may assume no duplicate exists in the array.

 Example 1:

 Input: [3,4,5,1,2]
 Output: 1
 Example 2:

 Input: [4,5,6,7,0,1,2]
 Output: 0
 */

class P153: XCTestCase {

    func findMin(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[left]
    }
    
    func testFindMin() {
        XCTAssertEqual(findMin([3,4,5,1,2]), 1)
        XCTAssertEqual(findMin([4,5,6,7,0,1,2]), 0)
        XCTAssertEqual(findMin([2, 1]), 1)
    }

}
