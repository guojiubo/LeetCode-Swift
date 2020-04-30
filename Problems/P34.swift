// Created on 2020/4/8

import XCTest

/*
 https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 34. Find First and Last Position of Element in Sorted Array
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

 Your algorithm's runtime complexity must be in the order of O(log n).

 If the target is not found in the array, return [-1, -1].

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

class P34: XCTestCase {
    
    func lowerBound(_ nums: [Int], _ target: Int) -> Int {
        var low = 0, high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
    
    func upperBound(_ nums: [Int], _ target: Int) -> Int {
        var low = 0, high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] <= target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let lower = lowerBound(nums, target)
        if lower == nums.count || nums[lower] != target {
            return [-1, -1]
        }
        let upper = upperBound(nums, target)
        return [lower, upper - 1]
    }
    
    func testSearchRange() {
        var range = searchRange([5,7,7,8,8,10], 8)
        XCTAssertEqual(range[0], 3)
        XCTAssertEqual(range[1], 4)
        
        range = searchRange([5,7,7,8,8,10], 6)
        XCTAssertEqual(range[0], -1)
        XCTAssertEqual(range[1], -1)
    }

}
