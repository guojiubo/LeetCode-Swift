// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/3sum/
 15. 3Sum
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */

class P15: XCTestCase {
    
    // sort
    // skip duplicated numbers
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        
        let nums = nums.sorted()
        
        var results: [[Int]] = []
        for i in 0..<nums.count - 2 {
            if nums[i] > 0 {
                break
            }
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var j = i + 1, k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum < 0 {
                    j += 1
                    while j < k && nums[j] == nums[j - 1] {
                        j += 1
                    }
                } else if sum > 0 {
                    k -= 1
                    while k > j && nums[k] == nums[k + 1] {
                        k -= 1
                    }
                } else {
                    results.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1
                    while j < k && nums[j] == nums[j - 1] {
                        j += 1
                    }
                    while k > j && nums[k] == nums[k + 1] {
                        k -= 1
                    }
                }
            }
        }
        return results
    }
    
    func testThreeSum() {
        var results = threeSum([0,0,0,0,0,0])
        XCTAssert(results.count == 1 && results[0][0] == 0 && results[0][1] == 0 && results[0][2] == 0)
        results = threeSum([-2,0,0,2,2])
        XCTAssert(results.count == 1 && results[0][0] == -2 && results[0][1] == 0 && results[0][2] == 2)
    }

}
