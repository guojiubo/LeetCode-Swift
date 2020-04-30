// Created on 2020/4/18

import XCTest

/*
 560. Subarray Sum Equals K
 Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

 Example 1:
 Input:nums = [1,1,1], k = 2
 Output: 2
 Note:
 The length of the array is in range [1, 20,000].
 The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
 */

class P560: XCTestCase {

    // use hash map to record the number of prefix sum's appearance
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        var map = [0: 1]
        var count = 0
        
        for i in 0..<nums.count {
            prefixSum += nums[i]
            count += map[prefixSum - k] ?? 0
            map[prefixSum, default: 0] += 1
        }
        
        return count
    }
    
    func testSubarraySum() {
        XCTAssertEqual(subarraySum([0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 0), 55)
        XCTAssertEqual(subarraySum([], 2), 0)
        XCTAssertEqual(subarraySum([2], 2), 1)
        XCTAssertEqual(subarraySum([1, 1, 1], 2), 2)
    }

}
