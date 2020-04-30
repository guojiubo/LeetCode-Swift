// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/first-missing-positive/
 41. First Missing Positive
 Given an unsorted integer array, find the smallest missing positive integer.

 Example 1:

 Input: [1,2,0]
 Output: 3
 Example 2:

 Input: [3,4,-1,1]
 Output: 2
 Example 3:

 Input: [7,8,9,11,12]
 Output: 1
 Note:

 Your algorithm should run in O(n) time and uses constant extra space.
 */

class P41: XCTestCase {

    // Use set
    // T: O(n), S: O(n)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        for i in stride(from: 1, through: nums.count, by: 1) {
            if !set.contains(i) {
                return i
            }
        }
        return nums.count + 1
    }
    
    // T: O(n), S: O(1)
    func firstMissingPositive2(_ nums: [Int]) -> Int {
        if !nums.contains(1) {
            return 1
        }
        
        var nums = nums.map{ $0 <= 0 || $0 > nums.count ? 1 : $0 }
                
        for var n in nums {
            n = abs(n)
            if nums[n - 1] > 0 {
                nums[n - 1] *= -1
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] > 0 {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
    
    func testFirstMissingPositive() {
        XCTAssertEqual(firstMissingPositive([]), 1)
        XCTAssertEqual(firstMissingPositive([1,2]), 3)
        XCTAssertEqual(firstMissingPositive([1,2,0]), 3)
        XCTAssertEqual(firstMissingPositive([3,4,-1,1]), 2)
        XCTAssertEqual(firstMissingPositive([7,8,9,11,12]), 1)
    }
    
    func testFirstMissingPositive2() {
        XCTAssertEqual(firstMissingPositive2([1,2]), 3)
        XCTAssertEqual(firstMissingPositive2([1,2,0]), 3)
        XCTAssertEqual(firstMissingPositive2([3,4,-1,1]), 2)
        XCTAssertEqual(firstMissingPositive2([7,8,9,11,12]), 1)
    }

}
