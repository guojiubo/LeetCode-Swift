// Created on 2020/4/29

import XCTest

/*
 https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/
 438. Find All Anagrams in a String
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

 The order of output does not matter.

 Example 1:

 Input:
 s: "cbaebabacd" p: "abc"

 Output:
 [0, 6]

 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input:
 s: "abab" p: "ab"

 Output:
 [0, 1, 2]

 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

class P438: XCTestCase {
    
    // sliding window
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var need: [Character: Int] = [:]
        var window: [Character: Int] = [:]

        for c in p {
            need[c, default: 0] += 1
        }

        let chars = Array(s)
        var match = 0               // number of matched letters
        var result: [Int] = []
        let len = p.count           // !!!Timeout if we don't store it's count
        var left = 0
        for right in 0..<chars.count {
            let ch = chars[right]
            window[ch, default: 0] += 1
            if need[ch] == window[ch] {
                match += 1
            }

            while match == need.count {
                if right - left + 1 == len {
                    result.append(left)
                }

                let ch2 = chars[left]
                if window[ch2] == need[ch2] {
                    match -= 1
                }
                window[ch2, default: 0] -= 1

                left += 1
            }
        }

        return result
    }
    
    func testFindAnagrams() {
        XCTAssertEqual(findAnagrams("cbaebabacd", "abc").description, "[0, 6]")
        XCTAssertEqual(findAnagrams("abab", "ab").description, "[0, 1, 2]")
    }

}
