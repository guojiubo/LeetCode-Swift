// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/rotate-matrix-lcci/
 面试题 01.07. Rotate Matrix LCCI
 Given an image represented by an N x N matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

  

 Example 1:

 Given matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 Rotate the matrix in place. It becomes:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 Example 2:

 Given matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 Rotate the matrix in place. It becomes:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 */

class LCCI0107: XCTestCase {

    // first reverse each row,
    // than swap along the diagonal
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        if n <= 1 { return }
        for row in 0..<n {
            var i = 0, j = n - 1
            while i < j {
                let temp = matrix[row][j]
                matrix[row][j] = matrix[row][i]
                matrix[row][i] = temp
                i += 1
                j -= 1
            }
        }
        
        for i in 0..<n {
            for j in 0..<n - i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[n - j - 1][n - i - 1]
                matrix[n - j - 1][n - i - 1] = temp
            }
        }
    }
    
    func testRotate() {
        var matrix =
        [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]
        rotate(&matrix)
    
        let expected =
        [
          [7,4,1],
          [8,5,2],
          [9,6,3]
        ]
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                XCTAssert(matrix[i][j] == expected[i][j])
            }
        }
    }

}
