// Created on 2020/4/28

import XCTest

/*
 https://leetcode-cn.com/problems/single-number-ii/
 137. Single Number II
 Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:

 Input: [2,2,3,2]
 Output: 3
 Example 2:

 Input: [0,1,0,1,0,1,99]
 Output: 99
 */

class P137: XCTestCase {

    // [3, 5, 3, 3]
    // 3 = 0 0 1 1
    // 3 = 0 0 1 1
    // 3 = 0 0 1 1
    // 5 = 0 1 0 1
    // -----------
    //     0 1 3 4
    // %3: 0 1 0 1
    func singleNumber(_ nums: [Int]) -> Int {
        var single = 0
        for i in 0..<32 {
            var count = 0
            for n in nums {
                count += (n >> i) & 1
            }
            single ^= (count % 3) << i
        }
        return single
    }
    
    func testSingleNumber() {
        XCTAssertEqual(singleNumber([2,2,3,2]), 3)
        XCTAssertEqual(singleNumber([0,1,0,1,0,1,99]), 99)
    }

}
