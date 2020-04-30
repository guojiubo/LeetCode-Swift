// Created on 2020/4/17

import XCTest

/*
 https://leetcode-cn.com/problems/single-number/
 136. Single Number
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:

 Input: [2,2,1]
 Output: 1
 Example 2:

 Input: [4,1,2,1,2]
 Output: 4
 */

class P136: XCTestCase {

    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
    
    func testSingleNumber() {
        XCTAssertEqual(singleNumber([2, 2, 1]), 1)
        XCTAssertEqual(singleNumber([4, 1, 2, 1, 2]), 4)
    }

}
