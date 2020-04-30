// Created on 2020/4/22

import XCTest

/*
 https://leetcode-cn.com/problems/next-greater-element-iii/
 556. Next Greater Element III
 Given a positive 32-bit integer n, you need to find the smallest 32-bit integer which has exactly the same digits existing in the integer n and is greater in value than n. If no such positive 32-bit integer exists, you need to return -1.

 Example 1:

 Input: 12
 Output: 21
  

 Example 2:

 Input: 21
 Output: -1
 */

class P556: XCTestCase {
    
    func nextGreaterElement(_ n: Int) -> Int {
        // convert n to digits array
        var digits: [Int] = []
        var n = n
        while n != 0 {
            digits.append(n % 10)
            n /= 10
        }
        digits.reverse()
        
        // get next permutation, same solutin as P31
        var i = digits.count - 2
        while i >= 0 && digits[i] >= digits[i + 1] {
            i -= 1
        }
        if i == -1 {
            return -1
        }
        
        var j = digits.count - 1
        while j >= i && digits[i] >= digits[j] {
            j -= 1
        }
        
        digits.swapAt(i, j)
        
        i = i + 1
        j = digits.count - 1
        while i < j {
            digits.swapAt(i, j)
            i += 1
            j -= 1
        }
        
        // convert back to number
        var number = 0
        let limit = 0x7fffffff
        for n in digits {
            if number > (limit - n) / 10 {
                return -1   // overflow
            }
            number = number * 10 + n
        }
        
        return number
    }
    
    func testNextGreaterElement() {
        XCTAssertEqual(nextGreaterElement(230241), 230412)
        XCTAssertEqual(nextGreaterElement(21), -1)
        XCTAssertEqual(nextGreaterElement(132), 213)
        XCTAssertEqual(nextGreaterElement(0x7fffffff), -1)
    }

}
