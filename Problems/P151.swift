// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/reverse-words-in-a-string/
 151. Reverse Words in a String
 Given an input string, reverse the string word by word.

  

 Example 1:

 Input: "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: "  hello world!  "
 Output: "world! hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Note:

 A word is defined as a sequence of non-space characters.
 Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
 You need to reduce multiple spaces between two words to a single space in the reversed string.
 */

class P151: XCTestCase {
    
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
    
    func testReverseWords() {
        XCTAssertEqual(reverseWords("  hello world!  "), "world! hello")
        XCTAssertEqual(reverseWords("a good   example"), "example good a")
    }

}
