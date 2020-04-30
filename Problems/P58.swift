// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/length-of-last-word/
 58. Length of Last Word
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.

 If the last word does not exist, return 0.

 Note: A word is defined as a maximal substring consisting of non-space characters only.

 Example:

 Input: "Hello World"
 Output: 5
 */

class P58: XCTestCase {

    // Hello World
    //      ^    ^
    //      j    i
    func lengthOfLastWord(_ s: String) -> Int {
        let chars = Array(s)
        
        var i = s.count - 1
        while i >= 0 && chars[i] == " " {
            i -= 1
        }
        if i < 0 { return 0 }
        
        var j = i
        while j >= 0 && chars[j] != " " {
            j -= 1
        }
        return i - j
    }
    
    func lengthOfLastWord2(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
    
    func testLengthOfLastWord() {
        XCTAssertEqual(lengthOfLastWord("Hello World"), 5)
        XCTAssertEqual(lengthOfLastWord("Hello World  "), 5)
        XCTAssertEqual(lengthOfLastWord("Hello  "), 5)
        XCTAssertEqual(lengthOfLastWord("  "), 0)
        XCTAssertEqual(lengthOfLastWord("a"), 1)
    }
    
    func testLengthOfLastWord2() {
        XCTAssertEqual(lengthOfLastWord2("Hello World"), 5)
        XCTAssertEqual(lengthOfLastWord2("Hello World  "), 5)
        XCTAssertEqual(lengthOfLastWord2("Hello  "), 5)
        XCTAssertEqual(lengthOfLastWord2("  "), 0)
        XCTAssertEqual(lengthOfLastWord2("a"), 1)
    }

}
