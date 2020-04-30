// Created on 2020/4/20

import XCTest

/*
 201. Bitwise AND of Numbers Range
 Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

 Example 1:

 Input: [5,7]
 Output: 4
 Example 2:

 Input: [0,1]
 Output: 0
 */

class P201: XCTestCase {

    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var n = n
        while m < n {
            n &= n - 1
        }
        return n
    }

}
