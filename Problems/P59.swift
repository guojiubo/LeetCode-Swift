// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/spiral-matrix-ii/
 59. Spiral Matrix II
 Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

 Example:

 Input: 3
 Output:
 [
  [ 1, 2, 3 ],
  [ 8, 9, 4 ],
  [ 7, 6, 5 ]
 ]
 */

class P59: XCTestCase {

    func generateMatrix(_ n: Int) -> [[Int]] {
        var left = 0, right = n - 1
        var top = 0, bottom = n - 1
        
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        var number = 1
        while number <= n * n {
            for i in stride(from: left, through: right, by: 1) {
                matrix[top][i] = number
                number += 1
            }
            top += 1
            if top > bottom { break }
            
            for i in stride(from: top, through: bottom, by: 1) {
                matrix[i][right] = number
                number += 1
            }
            right -= 1
            if left > right { break }
            
            for i in stride(from: right, through: left, by: -1) {
                matrix[bottom][i] = number
                number += 1
            }
            bottom -= 1
            if top > bottom { break }
            
            for i in stride(from: bottom, through: top, by: -1) {
                matrix[i][left] = number
                number += 1
            }
            left += 1
            if left > right { break }
        }
        
        return matrix
    }
    
    func testGenerateMatrix() {
        XCTAssertEqual(generateMatrix(5).description, "[[1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7], [14, 23, 22, 21, 8], [13, 12, 11, 10, 9]]")
    }

}
