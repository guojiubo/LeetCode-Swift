// Created on 2020/4/6

import XCTest

/*
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 3. Longest Substring Without Repeating Characters
 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

class P3: XCTestCase {

    // sliding window: [i, j) represent the window without repeating chars
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var map: [Character: Int] = [:]
        var i = 0, j = 0
        var longest = 0
        while j < chars.count {
            let ch = chars[j]
            // update window and calculate length once we reach a repeated char
            // ignore chars which are not in the sliding window ( whose index < i )
            if let last = map[ch], last >= i {
                longest = max(longest, j - i)
                i = last + 1
            }
            map[ch] = j
            j += 1
        }
        // in case that no repeating chars in the string at all
        return max(j - i, longest)
    }
    
    func testLengthOfLongestSubstring() {
        XCTAssert(lengthOfLongestSubstring("abc") == 3)
        XCTAssert(lengthOfLongestSubstring("abcabcbb") == 3)
        XCTAssert(lengthOfLongestSubstring("bbbbb") == 1)
        XCTAssert(lengthOfLongestSubstring("pwwkew") == 3)
        XCTAssert(lengthOfLongestSubstring("abba") == 2)
    }

}
