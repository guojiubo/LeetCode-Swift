// Created on 2020/4/14

import XCTest

/*
 https://leetcode-cn.com/problems/gray-code/
 89. Gray Code
 The gray code is a binary numeral system where two successive values differ in only one bit.

 Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.

 Example 1:

 Input: 2
 Output: [0,1,3,2]
 Explanation:
 00 - 0
 01 - 1
 11 - 3
 10 - 2

 For a given n, a gray code sequence may not be uniquely defined.
 For example, [0,2,3,1] is also a valid gray code sequence.

 00 - 0
 10 - 2
 11 - 3
 01 - 1
 Example 2:

 Input: 0
 Output: [0]
 Explanation: We define the gray code sequence to begin with 0.
              A gray code sequence of n has size = 2n, which for n = 0 the size is 20 = 1.
              Therefore, for n = 0 the gray code sequence is [0].
 */

class P89: XCTestCase {

    // 0   1    2      3
    //
    // 0   0    00    000
    //     1    01    001
    //          10    010
    //          11    011
    //                111
    //                110
    //                101
    //                100
    func grayCode(_ n: Int) -> [Int] {
        var codes = [0]
        for i in stride(from: 1, through: n, by: 1) {
            let count = codes.count
            let prepend = 1 << (i - 1)
            for j in stride(from: count - 1, through: 0, by: -1) {
                codes.append(codes[j] | prepend)
            }
        }
        return codes
    }
    
    func testGrayCode() {
        XCTAssertEqual(grayCode(0).description, "[0]")
        XCTAssertEqual(grayCode(1).description, "[0, 1]")
        XCTAssertEqual(grayCode(2).description, "[0, 1, 3, 2]")
        XCTAssertEqual(grayCode(3).description, "[0, 1, 3, 2, 6, 7, 5, 4]")
    }

}
