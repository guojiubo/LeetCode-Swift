// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/palindrome-number/
 9. Palindrome Number
 Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

 Example 1:

 Input: 121
 Output: true
 Example 2:

 Input: -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:

 Input: 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 Follow up:

 Coud you solve it without converting the integer to a string?
 */

class P9: XCTestCase {

    // reverse whole number
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        
        var n = x, y = 0
        while n != 0 {
            y = y * 10 + n % 10
            n /= 10
        }
        return x == y
    }
    
    // reverse second half number
    func isPalindrome2(_ x: Int) -> Bool {
        if x < 0 || (x != 0 && x % 10 == 0) {
            return false
        }
        var x = x, y = 0
        while y < x {
            y = y * 10 + x % 10
            x /= 10
        }
        return x == y || x == y / 10
    }
    
    func testIsPalindrome() {
        XCTAssertTrue(isPalindrome(1))
        XCTAssertTrue(isPalindrome(11))
        XCTAssertTrue(isPalindrome(121))
        XCTAssertFalse(isPalindrome(-121))
        XCTAssertFalse(isPalindrome(10))
    }
    
    func testIsPalindrome2() {
        XCTAssertTrue(isPalindrome2(1))
        XCTAssertTrue(isPalindrome2(11))
        XCTAssertTrue(isPalindrome2(121))
        XCTAssertFalse(isPalindrome2(-121))
        XCTAssertFalse(isPalindrome2(100))
    }

}
