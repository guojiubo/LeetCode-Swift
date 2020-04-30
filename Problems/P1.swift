// Created on 2020/4/2

/*
 https://leetcode-cn.com/problems/two-sum/submissions/
 1. Two Sum
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

import XCTest

class P1: XCTestCase {

    // hashmap solution
    // time: O(n), space: O(n)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for (idx, val) in nums.enumerated() {
            if let first = map[target - val] {
                return [first, idx]
            }
            map[val] = idx
        }
        return []
    }
    
    // sort & two pointer solution
    // time: O(nlogn), space: O(n)
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.sorted()
        var i = 0, j = sorted.count - 1
        while i < j {
            let sum = sorted[i] + sorted[j]
            if sum > target {
                j -= 1
            } else if sum < target {
                i += 1
            } else {
                break
            }
        }
        var result: [Int] = []
        for idx in 0..<nums.count {
            if sorted[i] == nums[idx] || sorted[j] == nums[idx] {
                result.append(idx)
            }
        }
        return result.sorted()
    }
    
    func testTwoSum() {
        let result = twoSum([2, 7, 11, 15], 9)
        print(result)
        XCTAssert(result[0] == 0)
        XCTAssert(result[1] == 1)
    }
    
    func testTwoSum2() {
        let result = twoSum2([3, 1, 1, 15], 2)
        print(result)
        XCTAssert(result[0] == 1)
        XCTAssert(result[1] == 2)
    }

}
