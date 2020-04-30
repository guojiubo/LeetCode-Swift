// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/valid-parentheses/
 20. Valid Parentheses
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:

 Input: "()"
 Output: true
 Example 2:

 Input: "()[]{}"
 Output: true
 Example 3:

 Input: "(]"
 Output: false
 Example 4:

 Input: "([)]"
 Output: false
 Example 5:

 Input: "{[]}"
 Output: true
 */

class P20: XCTestCase {

    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for c in s {
            if c == "(" || c == "{" || c == "[" {
                stack.append(c)
            } else if stack.isEmpty {
                return false
            } else if c == ")" && stack.removeLast() != "(" {
                return false
            } else if c == "}" && stack.removeLast() != "{" {
                return false
            } else if c == "]" && stack.removeLast() != "[" {
                return false
            }
        }
        return stack.isEmpty    // "["
    }
    
    func testIsValid() {
        XCTAssertFalse(isValid("("))
        XCTAssertTrue(isValid("()"))
        XCTAssertTrue(isValid("()[]{}"))
        XCTAssertFalse(isValid("(]"))
        XCTAssertFalse(isValid("([)]"))
        XCTAssertTrue(isValid("{[]}"))
    }

}
