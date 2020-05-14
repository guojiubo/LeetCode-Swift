// Created on 2020/5/14

import XCTest

/*
 https://leetcode-cn.com/problems/remove-k-digits/
 402. Remove K Digits
 Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

 Note:
 The length of num is less than 10002 and will be ≥ k.
 The given num does not contain any leading zero.
 Example 1:

 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 Example 2:

 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 Example 3:

 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
 */

class P402: XCTestCase {

    // delete num[i - 1] if num[i] < num[i - 1], else continue
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack: [Character] = []
        var k = k
        
        for n in num {
            while k > 0 && !stack.isEmpty && n < stack.last! {
                stack.removeLast()
                k -= 1
            }
            stack.append(n)
        }
        
        if k > 0 { stack.removeLast(k) }
        
        var result = ""
        var skipZeros = true
        
        for n in stack {
            if skipZeros && n == "0" { continue }
            skipZeros = false
            result.append(n)
        }
        
        return result == "" ? "0" : String(result)
    }
    
    func testRemoveKdigits() {
        XCTAssertEqual(removeKdigits("1432219", 3), "1219")
        XCTAssertEqual(removeKdigits("10200", 1), "200")
        XCTAssertEqual(removeKdigits("10", 2), "0")
    }

}
