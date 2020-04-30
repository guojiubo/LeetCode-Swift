// Created on 2020/4/29

import XCTest

/*
 394. Decode String
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Examples:

 s = "3[a]2[bc]", return "aaabcbc".
 s = "3[a2[c]]", return "accaccacc".
 s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
 */

class P394: XCTestCase {

    // https://leetcode-cn.com/problems/decode-string/solution/decode-string-fu-zhu-zhan-fa-di-gui-fa-by-jyd/
    func decodeString(_ s: String) -> String {
        var stack: [(Int, String)] = []
        var count = 0
        var string = ""
        for c in s {
            if c == "[" {
                stack.append((count, string))
                count = 0
                string = ""
            } else if c == "]" {
                let (count, last) = stack.removeLast()
                string = last + String(repeating: string, count: count)
            } else if c >= "0" && c <= "9" {
                count = count * 10 + Int(String(c))!
            } else {
                string += String(c)
            }
        }
        return string
    }
    
    func testDecodeString() {
        XCTAssertEqual(decodeString("abcc"), "abcc")
        XCTAssertEqual(decodeString("3[a]2[bc]"), "aaabcbc")
        XCTAssertEqual(decodeString("3[a2[c]]"), "accaccacc")
        XCTAssertEqual(decodeString("2[abc]3[cd]ef"), "abcabccdcdcdef")
    }

}
