// Created on 2020/4/13

import XCTest

/*
 https://leetcode-cn.com/problems/maximal-rectangle/
 85. Maximal Rectangle
 Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.

 Example:

 Input:
 [
   ["1","0","1","0","0"],
   ["1","0","1","1","1"],
   ["1","1","1","1","1"],
   ["1","0","0","1","0"]
 ]
 Output: 6
 */

class P85: XCTestCase {
    
    // borrowed from P84
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        let heights = [0] + heights + [0]
        var largest = 0
        for i in 0..<heights.count {
            while let topIndex = stack.last, heights[topIndex] > heights[i] {
                stack.removeLast()
                largest = max(largest, (i - stack.last! - 1) * heights[topIndex])
            }
            stack.append(i)
        }
        return largest
    }

    // T: O(MN), S: O(MN)
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        
        var heights = matrix.map{ $0.map{ $0 == "1" ? 1 : 0 } }
        for i in stride(from: 1, to: matrix.count, by: 1) {
            for j in stride(from: 0, to: matrix[0].count, by: 1) {
                if heights[i][j] != 0 {
                    heights[i][j] += heights[i - 1][j]
                }
            }
        }
        
        var maximal = 0
        for i in 0..<heights.count {
            maximal = max(maximal, largestRectangleArea(heights[i]))
        }
        return maximal
    }
    
    // T: O(NM), S: O(N)
    func maximalRectangle2(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        
        var maximal = 0
        var heights = Array(repeating: 0, count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == "1" {
                    heights[j] += 1
                } else {
                    heights[j] = 0
                }
            }
            maximal = max(maximal, largestRectangleArea(heights))
        }
        return maximal
    }
    
    func testMaximalRectangle() {
        let matrix: [[Character]] = [
          ["1","0","1","0","0"],
          ["1","0","1","1","1"],
          ["1","1","1","1","1"],
          ["1","0","0","1","0"]
        ]
        XCTAssertEqual(maximalRectangle(matrix), 6)
    }
    
    func testMaximalRectangle2() {
        let matrix: [[Character]] = [
          ["1","0","1","0","0"],
          ["1","0","1","1","1"],
          ["1","1","1","1","1"],
          ["1","0","0","1","0"]
        ]
        XCTAssertEqual(maximalRectangle2(matrix), 6)
    }

}
