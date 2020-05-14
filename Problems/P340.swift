// Created on 2020/5/14

import XCTest

/*
 https://leetcode-cn.com/problems/longest-substring-with-at-most-k-distinct-characters/
 340. Longest Substring with At Most K Distinct Characters
 Given a string, find the length of the longest substring T that contains at most k distinct characters.

 Example 1:

 Input: s = "eceba", k = 2
 Output: 3
 Explanation: T is "ece" which its length is 3.
 Example 2:

 Input: s = "aa", k = 1
 Output: 2
 Explanation: T is "aa" which its length is 2.
 */

class P340: XCTestCase {

    // Sliding window, use window.count to get distinct chars in it
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var window: [Character: Int] = [:]
        var i = 0
        var longest = 0
        
        for j in 0..<s.count {
            window[s[j], default: 0] += 1
            
            while window.count > k {
                window[s[i], default: 0] -= 1
                if window[s[i]] == 0 {
                    window[s[i]] = nil  // remove
                }
                i += 1
            }
            
            longest = max(longest, j - i + 1)
        }
        
        return longest
    }
    
    func testLengthOfLongestSubstringKDistinct() {
        XCTAssertEqual(lengthOfLongestSubstringKDistinct("eceba", 2), 3)
        XCTAssertEqual(lengthOfLongestSubstringKDistinct("aa", 1), 2)
    }

}
