// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/add-binary/
 67. Add Binary
 Given two binary strings, return their sum (also a binary string).

 The input strings are both non-empty and contains only characters 1 or 0.

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  

 Constraints:

 Each string consists only of '0' or '1' characters.
 1 <= a.length, b.length <= 10^4
 Each string is either "0" or doesn't contain any leading zero.
 */

class P67: XCTestCase {

    func addBinary(_ a: String, _ b: String) -> String {
        let charsA = Array(a), charsB = Array(b)
        var result: [Character] = []
        var carry = 0
        var i = charsA.count - 1, j = charsB.count - 1
        while i >= 0 || j >= 0 || carry == 1 {
            var num = carry
            if i >= 0 {
                let n = charsA[i] == "0" ? 0 : 1
                num ^= n
                carry += n
                i -= 1
            }
            if j >= 0 {
                let n = charsB[j] == "0" ? 0 : 1
                num ^= n
                carry += n
                j -= 1
            }
            result.append(Character("\(num)"))
            carry = carry > 1 ? 1 : 0
        }
        return String(result.reversed())
    }
    
    func testAddBinary() {
        XCTAssertEqual(addBinary("11", "1"), "100")
        XCTAssertEqual(addBinary("1010", "1011"), "10101")
    }

}
