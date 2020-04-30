// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/valid-palindrome/
 125. Valid Palindrome
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
 */

class P125: XCTestCase {
    
    func isAlphanumeric(_ c: Character) -> Bool {
        switch c {
        case "0"..."9", "a"..."z", "A"..."Z":
            return true
        default:
            return false
        }
    }

    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var i = 0, j = s.count - 1
        while i < j {
            if !isAlphanumeric(s[i]) {
                i += 1
                continue
            }
            if !isAlphanumeric(s[j]) {
                j -= 1
                continue
            }
            if s[i].lowercased() != s[j].lowercased() {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    func testIsPalindrome() {
        XCTAssertTrue(isPalindrome("A man, a plan, a canal: Panama"))
        XCTAssertFalse(isPalindrome("race a car"))
    }

}
