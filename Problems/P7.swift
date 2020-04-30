// Created on 2020/4/7

import XCTest

/*
 7. Reverse Integer
 Given a 32-bit signed integer, reverse digits of an integer.

 Example 1:

 Input: 123
 Output: 321
 Example 2:

 Input: -123
 Output: -321
 Example 3:

 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

class P7: XCTestCase {

    func reverse(_ x: Int) -> Int {
        let max = 0x7fffffff
        let min = -max - 1
        var n = 0
        var x = x
        while x != 0 {
            let remainder = x % 10
            if remainder < 0 && n < (min - remainder) / 10 {
                return 0
            } else if n > (max - remainder) / 10 {
                return 0
            }
            n = n * 10 + remainder
            x = x / 10
        }
        return n
    }
    
    func testReverse() {
        XCTAssert(reverse(123) == 321)
        XCTAssert(reverse(-123) == -321)
        XCTAssert(reverse(12345678902999999) == 0)
        XCTAssert(reverse(-12345678902999999) == 0)
    }

}
