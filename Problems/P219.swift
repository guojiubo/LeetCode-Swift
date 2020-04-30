// Created on 2020/4/21

import XCTest

/*
 https://leetcode-cn.com/problems/contains-duplicate-ii/
 219. Contains Duplicate II
 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.

 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 */

class P219: XCTestCase {

    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            if let prev = map[nums[i]], i - prev <= k {
                return true
            }
            map[nums[i]] = i
        }
        return false
    }
    
    func testContainsNearbyDuplicate() {
        XCTAssertTrue(containsNearbyDuplicate([1,2,3,1], 3))
        XCTAssertTrue(containsNearbyDuplicate([1,0,1,1], 1))
        XCTAssertFalse(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }

}
