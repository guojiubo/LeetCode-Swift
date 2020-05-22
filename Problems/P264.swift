// Created on 2020/5/15

import XCTest

/*
 https://leetcode-cn.com/problems/ugly-number-ii/
 264. Ugly Number II
 Write a program to find the n-th ugly number.

 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

 Example:

 Input: n = 10
 Output: 12
 Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
 Note:

 1 is typically treated as an ugly number.
 n does not exceed 1690.
 */

class P264: XCTestCase {

    //  three ways merge
    //  i2: 1*2, 2*2, 3*2, 4*2, 5*2, ...
    //  i3: 1*3, 2*3, 3*3, 4*3, 5*3, ...
    //  i5: 1*5, 2*5, 3*5, 4*5, 5*5, ...
    //  move every pointer when equal
    func nthUglyNumber(_ n: Int) -> Int {
        var nums = Array(repeating: 1, count: n)
        var i2 = 0, i3 = 0, i5 = 0
        
        for i in 1..<n {
            nums[i] = min(nums[i2] * 2, nums[i3] * 3, nums[i5] * 5)
            
            if nums[i] == nums[i2] * 2 { i2 += 1 }
            if nums[i] == nums[i3] * 3 { i3 += 1 }
            if nums[i] == nums[i5] * 5 { i5 += 1 }
        }
        
        return nums[n - 1]
    }
    
    func testNthUglyNumber() {
        XCTAssertEqual(nthUglyNumber(10), 12)
    }

}
