// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/plus-one/
 66. Plus One
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.

 Example 1:

 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:

 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */

class P66: XCTestCase {

    func reverse(_ nums: inout [Int]) {
        var i = 0, j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var result: [Int] = []
        var carry = 1               // plus one
        var i = digits.count - 1
        while i >= 0 || carry == 1 {
            var sum = carry
            if i >= 0 {
                sum += digits[i]
            }
            result.append(sum % 10)
            carry = sum / 10
            i -= 1
        }
        reverse(&result)
        return result
    }
    
    func testPlusOne() {
        XCTAssertEqual(plusOne([1,2,3]).description, "[1, 2, 4]")
        XCTAssertEqual(plusOne([4,3,2,1]).description, "[4, 3, 2, 2]")
    }

}
