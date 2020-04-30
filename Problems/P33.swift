// Created on 2020/4/8

import XCTest

/*
 https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
 33. Search in Rotated Sorted Array
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

class P33: XCTestCase {

    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count
        
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            }
            // either left or right side is fully ordered
            if nums[left] <= nums[mid] {
                // left side [left, mid) is fully ordered
                if target >= nums[left] && target < nums[mid] {
                    right = mid
                } else {
                    left = mid + 1
                }
            } else {
                // right side [mid + 1, right) is fully ordered
                if target > nums[mid] && target <= nums[right - 1] {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
        }
        
        return -1
    }
    
    func testSearch() {
        XCTAssertEqual(search([1], 0), -1)
        
        var nums = [4,5,6,7,0,1,2]
        for (i, v) in nums.enumerated() {
            XCTAssertEqual(search(nums, v), i)
        }

        nums = [4,5,6,7]
        for (i, v) in nums.enumerated() {
            XCTAssertEqual(search(nums, v), i)
        }
    }

}
