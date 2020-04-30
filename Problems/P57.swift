// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/insert-interval/
 57. Insert Interval
 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

 You may assume that the intervals were initially sorted according to their start times.

 Example 1:

 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 Example 2:

 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
 */

class P57: XCTestCase {

    // same solution as P56, first append, than sort and merge
    // T: O(NlogN), S: O(N)
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var intervals = intervals
        intervals.append(newInterval)
        intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
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
    
    // https://leetcode-cn.com/problems/insert-interval/solution/57-cha-ru-qu-jian-by-alexer-660/
    // T: O(N)
    func insert2(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var merged: [[Int]] = []
        
        var i = 0

        // add all non-intersect intervals starting before new interval
        while i < intervals.count && intervals[i][1] < newInterval[0] {
            merged.append(intervals[i])
            i += 1
        }
        
        // merge intervals until non-intersect, add it
        var pending = newInterval
        while i < intervals.count && pending[1] >= intervals[i][0] {
            pending[0] = min(intervals[i][0], pending[0])
            pending[1] = max(intervals[i][1], pending[1])
            i += 1
        }
        merged.append(pending)
        
        // add the rest part
        while i < intervals.count {
            merged.append(intervals[i])
            i += 1
        }
        
        return merged
    }
    
    func testInsert() {
        XCTAssertEqual(insert([[1,3],[6,9]], [2,5]).description, "[[1, 5], [6, 9]]")
        XCTAssertEqual(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]).description, "[[1, 2], [3, 10], [12, 16]]")
    }
    
    func testInsert2() {
        XCTAssertEqual(insert2([[1,3],[6,9]], [2,5]).description, "[[1, 5], [6, 9]]")
        XCTAssertEqual(insert2([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]).description, "[[1, 2], [3, 10], [12, 16]]")
    }

}
