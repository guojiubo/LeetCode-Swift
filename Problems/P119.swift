// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/pascals-triangle-ii/
 119. Pascal's Triangle II
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.

 Note that the row index starts from 0.


 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Example:

 Input: 3
 Output: [1,3,3,1]
 Follow up:

 Could you optimize your algorithm to use only O(k) extra space?
 */

class P119: XCTestCase {

    // key: from back to front
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = Array(repeating: 1, count: rowIndex + 1)
        for i in stride(from: 0, through: rowIndex, by: 1) {
            for j in stride(from: i - 1, through: 1, by: -1) {
                row[j] = row[j - 1] + row[j]
            }
        }
        return row
    }
    
    func testGetRow() {
        XCTAssertEqual(getRow(3).description, "[1, 3, 3, 1]")
    }
    
}
