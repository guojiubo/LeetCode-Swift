// Created on 2020/4/30

import XCTest

/*
 https://leetcode-cn.com/problems/happy-number/
 202. Happy Number
 Write an algorithm to determine if a number n is "happy".

 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

 Return True if n is a happy number, and False if not.

 Example:

 Input: 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

class P202: XCTestCase {
    
    func squareSum(_ n: Int) -> Int {
        var sum = 0
        var n = n
        while n != 0 {
            sum += (n % 10) * (n % 10)
            n /= 10
        }
        return sum
    }
    
    // use hashset to detect endless loop
    func isHappy(_ n: Int) -> Bool {
        var set: Set<Int> = []
        var curr = n
        while curr != 1 {
            curr = squareSum(curr)
            if set.contains(curr) {
                return false
            }
            set.insert(curr)
        }
        return true
    }
    
    // use slow/fast pointer approach
    func isHappy2(_ n: Int) -> Bool {
        var slow = n, fast = squareSum(n)
        while fast != 1 && slow != fast {
            slow = squareSum(slow)
            fast = squareSum(fast)
            fast = squareSum(fast)
        }
        return fast == 1
    }
    
    func testIsHappy() {
        XCTAssertTrue(isHappy(19))
        XCTAssertFalse(isHappy(243))
    }
    
    func testIsHappy2() {
        XCTAssertTrue(isHappy2(19))
        XCTAssertFalse(isHappy2(243))
    }

}
