// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/pascals-triangle/
 118. Pascal's Triangle
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Example:

 Input: 5
 Output:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 */

class P118: XCTestCase {
    
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle: [[Int]] = []
        for i in 0..<numRows {
            triangle.append(Array(repeating: 1, count: i + 1))
            
            for j in stride(from: 1, through: i - 1, by: 1) {
                triangle[i][j] = triangle[i - 1][j - 1] + triangle[i - 1][j]
            }
        }
        return triangle
    }
    
    func testGenerate() {
        XCTAssertEqual(generate(5).description, "[[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]")
    }

}
