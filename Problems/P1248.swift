// Created on 2020/4/21

import XCTest

/*
 https://leetcode-cn.com/problems/count-number-of-nice-subarrays/
 1248. Count Number of Nice Subarrays
 Given an array of integers nums and an integer k. A subarray is called nice if there are k odd numbers on it.

 Return the number of nice sub-arrays.

  

 Example 1:

 Input: nums = [1,1,2,1,1], k = 3
 Output: 2
 Explanation: The only sub-arrays with 3 odd numbers are [1,1,2,1] and [1,2,1,1].
 Example 2:

 Input: nums = [2,4,6], k = 1
 Output: 0
 Explanation: There is no odd numbers in the array.
 Example 3:

 Input: nums = [2,2,2,1,2,2,1,2,2,2], k = 2
 Output: 16
  

 Constraints:

 1 <= nums.length <= 50000
 1 <= nums[i] <= 10^5
 1 <= k <= nums.length
 */

class P1248: XCTestCase {
    
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0       // number of odd numbers currently appeared
        var counter = [0: 1]    // counter[x] = y means the number of subarrays containing x odd numbers currently appeared is y
        var number = 0
        for n in nums {
            prefixSum += n & 1
            number += counter[prefixSum - k] ?? 0
            counter[prefixSum, default: 0] += 1
        }
        return number
    }
    
    // use array instead of hashmap
    func numberOfSubarrays2(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        var counter = Array(repeating: 0, count: nums.count + 1)    // why count + 1? consider [1, 1, 1], we will reach counter[3]
        counter[0] = 1
        var number = 0
        for n in nums {
            prefixSum += n & 1
            number += prefixSum >= k ? counter[prefixSum - k] : 0
            counter[prefixSum] += 1
        }
        return number
    }
    
    func testNumberOfSubarrays() {
        XCTAssertEqual(numberOfSubarrays([1,1,2,1,1], 3), 2)
        XCTAssertEqual(numberOfSubarrays([2,4,6], 1), 0)
        XCTAssertEqual(numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2), 16)
    }
    
    func testNumberOfSubarrays2() {
        XCTAssertEqual(numberOfSubarrays2([1,1,2,1,1], 3), 2)
        XCTAssertEqual(numberOfSubarrays2([2,4,6], 1), 0)
        XCTAssertEqual(numberOfSubarrays2([2,2,2,1,2,2,1,2,2,2], 2), 16)
    }
    
}
