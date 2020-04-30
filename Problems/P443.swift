// Created on 2020/4/3

import XCTest

/*
 https://leetcode-cn.com/problems/string-compression/
 443. String Compression
 Given an array of characters, compress it in-place.

 The length after compression must always be smaller than or equal to the original array.

 Every element of the array should be a character (not int) of length 1.

 After you are done modifying the input array in-place, return the new length of the array.

  
 Follow up:
 Could you solve it using only O(1) extra space?

  
 Example 1:

 Input:
 ["a","a","b","b","c","c","c"]

 Output:
 Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]

 Explanation:
 "aa" is replaced by "a2". "bb" is replaced by "b2". "ccc" is replaced by "c3".
  

 Example 2:

 Input:
 ["a"]

 Output:
 Return 1, and the first 1 characters of the input array should be: ["a"]

 Explanation:
 Nothing is replaced.
  

 Example 3:

 Input:
 ["a","b","b","b","b","b","b","b","b","b","b","b","b"]

 Output:
 Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].

 Explanation:
 Since the character "a" does not repeat, it is not compressed. "bbbbbbbbbbbb" is replaced by "b12".
 Notice each digit has it's own entry in the array.
  

 Note:

 All characters have an ASCII value in [35, 126].
 1 <= len(chars) <= 1000.
 */

class P443: XCTestCase {
    // k : index for rewrite
    // [i, j) : range of chars which are equal
    func compress(_ chars: inout [Character]) -> Int {
        var i = 0, k = 0
        while i < chars.count {
            chars[k] = chars[i]
            
            var j = i + 1
            while j < chars.count && chars[j] == chars[j - 1] {
                j += 1
            }
            
            let count = j - i
            if count > 1 {
                for c in String(count) {
                    chars[k + 1] = c
                    k += 1
                }
            }
            
            k += 1
            i = j
        }
        return k
    }
    
    func testCompress() {
        let cases: [[Character] : Int] = [
            ["a","a","b","b","c","c","c"] : 6,
            ["a"] : 1,
            ["a","b","b","b","b","b","b","b","b","b","b","b","b"]: 4
        ]
        for (k, v) in cases {
            var chars = k
            XCTAssert(compress(&chars) == v)
            print(chars[0..<v])
        }
    }

}
