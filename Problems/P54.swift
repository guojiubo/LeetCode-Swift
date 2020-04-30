// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/spiral-matrix/
 54. Spiral Matrix
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

 Example 1:

 Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:

 Input:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 */

class P54: XCTestCase {

    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty || matrix[0].isEmpty {
            return []
        }
        
        let m = matrix.count, n = matrix[0].count
        var top = 0, bottom = m - 1
        var left = 0, right = n - 1
        
        var result: [Int] = []
        while result.count < m * n {
            for i in stride(from: left, through: right, by: 1) {
                result.append(matrix[top][i])
            }
            top += 1
            if top > bottom { break }
            
            for i in stride(from: top, through: bottom, by: 1) {
                result.append(matrix[i][right])
            }
            right -= 1
            if left > right { break }
            
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
            if top > bottom { break }
            
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            left += 1
            if left > right { break }
        }
        return result
    }
    
    func testSpiralOrder() {
        var matrix = [
         [ 1, 2, 3 ],
         [ 4, 5, 6 ],
         [ 7, 8, 9 ]
        ]
        XCTAssertEqual(spiralOrder(matrix).description, "[1, 2, 3, 6, 9, 8, 7, 4, 5]")
        
        matrix = [
          [1, 2, 3, 4],
          [5, 6, 7, 8],
          [9,10,11,12]
        ]
        XCTAssertEqual(spiralOrder(matrix).description, "[1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]")
    }

}
