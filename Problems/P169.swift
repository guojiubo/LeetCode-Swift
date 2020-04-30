// Created on 2020/4/20

import XCTest

/*
 https://leetcode-cn.com/problems/majority-element/
 169. Majority Element
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:

 Input: [3,2,3]
 Output: 3
 Example 2:

 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

class P169: XCTestCase {

    // Boyer-Moore
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0, vote = 0
        for n in nums {
            if vote == 0 {
                candidate = n
            }
            if n == candidate {
                vote += 1
            } else {
                vote -= 1
            }
        }
        return candidate
    }
    
    func testMajorityElement() {
        XCTAssertEqual(majorityElement([3, 2, 3]), 3)
        XCTAssertEqual(majorityElement([2, 2, 1, 1, 1, 2, 2]), 2)
    }

}
