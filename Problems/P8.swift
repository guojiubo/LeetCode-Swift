// Created on 2020/4/3

/*
 https://leetcode-cn.com/problems/string-to-integer-atoi/
 8. String to Integer (atoi)
 Implement atoi which converts a string to an integer.

 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

 If no valid conversion could be performed, a zero value is returned.

 Note:

 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 Example 1:

 Input: "42"
 Output: 42
 Example 2:

 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
              Then take as many numerical digits as possible, which gets 42.
 Example 3:

 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:

 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
              digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:

 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
              Thefore INT_MIN (−231) is returned.
 */

import XCTest

class P8: XCTestCase {
    
    func myAtoi(_ str: String) -> Int {
        let chars = Array(str)
        // skip white space
        var i = 0
        while i < chars.count && chars[i] == " " {
            i += 1
        }
        // empty or only contains white space
        if i == chars.count {
            return 0
        }
        // determine sign
        var num = 0
        var sign = 1
        if chars[i] == "+" {
            i += 1
        } else if chars[i] == "-" {
            sign = -1
            i += 1
        }
        // calculate number
        while i < chars.count && chars[i] >= "0" && chars[i] <= "9" {
            let n = Int(String(chars[i]))!
            let limit = (1 << 31) - 1
            if num > (limit - n) / 10 {
                num = sign == -1 ? limit + 1 : limit
                break
            }
            num = num * 10 + Int(String(chars[i]))!
            i += 1
        }
        return num * sign
    }
    
    // DFA (deterministic finite automaton)
    // state    blank     +/-     0-9      other
    //  0           0       1       2       3
    //  1           3       3       2       3
    //  2           3       3       2       3
    //  3           3       3       3       3
    func myAtoi2(_ str: String) -> Int {
        let transfer = [
            [0, 1, 2, 3],
            [3, 3, 2, 3],
            [3, 3, 2, 3],
            [3, 3, 3, 3]
        ]
        
        var state = 0
        var sign = 1
        var num = 0
        for c in str {
            var col = 0
            switch c {
            case " ":       col = 0
            case "+", "-":  col = 1
            case "0"..."9": col = 2
            default:        col = 3
            }
            
            state = transfer[state][col]
            if state == 3 {
                return sign * num
            } else if state == 1 {
                sign = c == "-" ? -1 : 1
            } else if state == 2 {
                let n = Int(String(c))!
                let limit = 0x7fffffff
                if num > (limit - n) / 10 {
                    return sign == -1 ? -limit - 1 : limit
                }
                num = num * 10 + n
            }
        }
        return sign * num
    }
    
    func testMyAtoi() {
        XCTAssert(myAtoi("") == 0)
        XCTAssert(myAtoi("42") == 42)
        XCTAssert(myAtoi("    -42-1") == -42)
        XCTAssert(myAtoi("4193 with words") == 4193)
        XCTAssert(myAtoi("words and 987") == 0)
        XCTAssert(myAtoi("91283472332") == 2147483647)
        XCTAssert(myAtoi("-91283472332") == -2147483648)
    }
    
    func testMyAtoi2() {
        XCTAssert(myAtoi2("") == 0)
        XCTAssert(myAtoi2("42") == 42)
        XCTAssert(myAtoi2("    -42-1") == -42)
        XCTAssert(myAtoi2("4193 with words") == 4193)
        XCTAssert(myAtoi2("words and 987") == 0)
        XCTAssert(myAtoi2("91283472332") == 2147483647)
        XCTAssert(myAtoi2("-91283472332") == -2147483648)
    }
    
}
