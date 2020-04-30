// Created on 2020/4/28

import XCTest

/*
 https://leetcode-cn.com/problems/single-number-iii/
 260. Single Number III
 Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.

 Example:

 Input:  [1,2,1,3,2,5]
 Output: [3,5]
 Note:

 The order of the result is not important. So in the above example, [5, 3] is also correct.
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
 */

class P260: XCTestCase {

    func singleNumber(_ nums: [Int]) -> [Int] {
        var xor = 0
        for n in nums {
            xor ^= n
        }
        let bitmask = xor & -xor
        var a = 0
        for n in nums where n & bitmask == 0 {
            a ^= n
        }
        return [a, xor^a]
    }
    
    func testSingleNumber() {
        XCTAssertEqual(singleNumber([1,2,1,3,2,5]).description, "[5, 3]")
    }

}
