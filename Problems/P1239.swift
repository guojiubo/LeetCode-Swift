// Created on 2020/4/21

import XCTest

/*
 1239. Maximum Length of a Concatenated String with Unique Characters
 Given an array of strings arr. String s is a concatenation of a sub-sequence of arr which have unique characters.

 Return the maximum possible length of s.

  

 Example 1:

 Input: arr = ["un","iq","ue"]
 Output: 4
 Explanation: All possible concatenations are "","un","iq","ue","uniq" and "ique".
 Maximum length is 4.
 Example 2:

 Input: arr = ["cha","r","act","ers"]
 Output: 6
 Explanation: Possible solutions are "chaers" and "acters".
 Example 3:

 Input: arr = ["abcdefghijklmnopqrstuvwxyz"]
 Output: 26
  

 Constraints:

 1 <= arr.length <= 16
 1 <= arr[i].length <= 26
 arr[i] contains only lower case English letters.
 */

class P1239: XCTestCase {

    func maxLength(_ arr: [String]) -> Int {
        
        func getBitMask(_ s: String) -> Int {
            var bitMask = 0
            for c in s {
                var mask = 1                    // one line code as 'let mask = 1 << (c.asciiValue! - 97)' won't work because
                                                // Swift will treat mask as UInt8 (due to asciiValue is type of UInt8),
                                                // once c.asciiValue! - 97 > 7, overflow happens and mask will be zero
                                                // hence we split it into two lines, such that mask will be Int instead
                
                mask <<= (c.asciiValue! - 97)   // 97 is the ascii value of 'a'
                if bitMask & mask != 0 {
                    return 0                    // contains duplicated char
                }
                bitMask |= mask
            }
            return bitMask
        }
        
        var map: [String: Int] = [:]
        for s in arr {
            map[s] = getBitMask(s)
        }
        
        var len = 0
        
        func backtrack(_ path: String, _ pathMask: Int, _ index: Int) {
            len = max(len, path.count)
            
            for i in index..<arr.count {
                guard let bitMask = map[arr[i]], bitMask & pathMask == 0 else {
                    continue
                }
                if bitMask == 0 {
                    continue
                }
                backtrack(path + arr[i], pathMask | bitMask, i + 1)
            }
        }
        
        backtrack("", 0, 0)
        return len
    }
    
    func testMaxLength() {
        XCTAssertEqual(maxLength(["yy","aa","cdc"]), 0)
        XCTAssertEqual(maxLength(["un","iq","ue"]), 4)
        XCTAssertEqual(maxLength(["cha","r","act","ers"]), 6)
        XCTAssertEqual(maxLength(["abcdefghijklmnopqrstuvwxyz"]), 26)
    }

}
