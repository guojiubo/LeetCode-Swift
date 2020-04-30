// Created on 2020/4/15

import XCTest

/*
 https://leetcode-cn.com/problems/01-matrix/
 542. 01 Matrix
 Given a matrix consists of 0 and 1, find the distance of the nearest 0 for each cell.

 The distance between two adjacent cells is 1.

  

 Example 1:

 Input:
 [[0,0,0],
  [0,1,0],
  [0,0,0]]

 Output:
 [[0,0,0],
  [0,1,0],
  [0,0,0]]
 Example 2:

 Input:
 [[0,0,0],
  [0,1,0],
  [1,1,1]]

 Output:
 [[0,0,0],
  [0,1,0],
  [1,2,1]]
  

 Note:

 The number of elements of the given matrix will not exceed 10,000.
 There are at least one 0 in the given matrix.
 The cells are adjacent in only four directions: up, down, left and right.
 */

class P542: XCTestCase {
    
    // BFS
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count, n = matrix[0].count
        var matrix = matrix
        var queue: [(Int, Int)] = []
        
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    queue.append((i, j))
                } else {
                    matrix[i][j] = -1       // use -1 to identify cells that have not been visited yet
                }
            }
        }
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var distance = 1
        
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let (i, j) = queue.removeFirst()
                
                for direction in directions {
                    let x = i + direction.0
                    let y = j + direction.1
                    if x < 0 || x >= m || y < 0 || y >= n || matrix[x][y] != -1 {
                        continue
                    }
                    matrix[x][y] = distance
                    queue.append((x, y))
                }
            }
            distance += 1
        }
        
        return matrix
    }

    
    // DP
    func updateMatrix2(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count, n = matrix[0].count
        
        var matrix = matrix
        
        // top-left to bottom-right
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] != 0 {
                    var distance = m + n - 1
                    if i > 0 {
                        distance = min(distance, matrix[i - 1][j])
                    }
                    if j > 0 {
                        distance = min(distance, matrix[i][j - 1])
                    }
                    matrix[i][j] = 1 + distance
                }
            }
        }
        
        // bottom-right to top-left
        for i in stride(from: m - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                if matrix[i][j] != 0 {
                    var distance = m + n - 1
                    if i + 1 < m {
                        distance = min(distance, matrix[i + 1][j])
                    }
                    if j + 1 < n {
                        distance = min(distance, matrix[i][j + 1])
                    }
                    matrix[i][j] = min(matrix[i][j], 1 + distance)
                }
            }
        }
        
        return matrix
    }
    
    func testUpdateMatrix() {
        let matrix = [[1, 0, 1], [1, 1, 1], [1, 1, 1], [1, 1, 1]]
        XCTAssertEqual(updateMatrix(matrix).description, "[[1, 0, 1], [2, 1, 2], [3, 2, 3], [4, 3, 4]]")
    }
    
    func testUpdateMatrix2() {
        let matrix = [[1, 0, 1], [1, 1, 1], [1, 1, 1], [1, 1, 1]]
        XCTAssertEqual(updateMatrix2(matrix).description, "[[1, 0, 1], [2, 1, 2], [3, 2, 3], [4, 3, 4]]")
    }

}
