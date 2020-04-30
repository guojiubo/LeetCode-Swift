// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/longest-consecutive-sequence/
 128. Longest Consecutive Sequence
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

 Your algorithm should run in O(n) complexity.

 Example:

 Input: [100, 4, 200, 1, 3, 2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 */

class P128: XCTestCase {

    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var longest = 0
        
        for num in set {
            if set.contains(num - 1) {              //  sequence begins with num - 1 already calculated, skip it
                continue
            }
            var len = 1
            var increase = 1
            while set.contains(num + increase) {
                increase += 1
                len += 1
            }
            longest = max(longest, len)
        }
        
        return longest
    }
    
    func testLongestConsecutive() {
        XCTAssertEqual(longestConsecutive([100, 4, 200, 1, 3, 2]), 4)
    }

}
