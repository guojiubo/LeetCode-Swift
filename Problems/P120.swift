// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/triangle/
 120. Triangle
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

 For example, given the following triangle

 [
      [2],
     [3,4],
    [6,5,7],
   [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

 Note:

 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 */

class P120: XCTestCase {

    // 2
    // | \
    // 3  4
    // | \| \
    // 6  5  7
    // |\ |\ | \
    // 4  1  8  3
    // bottom to up
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var triangle = triangle
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                triangle[i][j] += min(triangle[i + 1][j], triangle[i + 1][j + 1])
            }
        }
        return triangle[0][0]
    }
    
    func testMinimumTotal() {
        let triangle = [
             [2],
            [3,4],
           [6,5,7],
          [4,1,8,3]
        ]
        XCTAssertEqual(minimumTotal(triangle), 11)
    }

}
