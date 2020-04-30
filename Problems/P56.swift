// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/merge-intervals/
 56. Merge Intervals
 Given a collection of intervals, merge all overlapping intervals.

 Example 1:

 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 */

class P56: XCTestCase {

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty { return [] }
        
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
        var merged: [[Int]] = []
        for interval in intervals {
            if merged.isEmpty || merged[merged.count - 1][1] < interval[0] {
                merged.append(interval)
            } else {
                merged[merged.count - 1][1] = max(interval[1], merged[merged.count - 1][1])
            }
        }
        return merged
    }
    
    func testMerge() {
        XCTAssertEqual(merge([[1,3]]).description, "[[1, 3]]")
        XCTAssertEqual(merge([[1,3],[2,6],[8,10],[15,18]]).description, "[[1, 6], [8, 10], [15, 18]]")
        XCTAssertEqual(merge([[1,4],[4,5]]).description, "[[1, 5]]")
    }

}
