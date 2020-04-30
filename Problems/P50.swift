// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/powx-n/
 50. Pow(x, n)
 Implement pow(x, n), which calculates x raised to the power n (xn).

 Example 1:

 Input: 2.00000, 10
 Output: 1024.00000
 Example 2:

 Input: 2.10000, 3
 Output: 9.26100
 Example 3:

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 Note:

 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 */

class P50: XCTestCase {

    // fast pow
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        
        var x = x, n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        
        let half = myPow(x, n / 2)
        
        return n % 2 == 0 ? half * half : x * half * half
    }
    
    // https://leetcode-cn.com/problems/powx-n/solution/qing-xi-jian-dan-de-dan-han-shu-di-gui-wu-lei-xing/
    func myPow2(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n == 1 { return x }
        if n == -1 { return 1 / x }
        let half = myPow2(x, n / 2)
        let rest = myPow2(x, n % 2)
        return rest * half * half
    }
    
    func testMyPow() {
        XCTAssertEqual(myPow(2, 10), pow(2, 10))
        XCTAssertEqual(myPow(2.1, 3), pow(2.1, 3))
        XCTAssertEqual(myPow(2, -2), pow(2, -2))
    }
    
    func testMyPow2() {
        XCTAssertEqual(myPow2(2, 10), pow(2, 10))
        XCTAssertEqual(myPow2(2.1, 3), pow(2.1, 3))
        XCTAssertEqual(myPow2(2, -2), pow(2, -2))
    }

}
