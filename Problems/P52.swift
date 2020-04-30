// Created on 2020/4/26

import XCTest

/*
 https://leetcode-cn.com/problems/n-queens-ii/
 52. N-Queens II
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

 Example:

 Input: 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown below.
 [
  [".Q..",  // Solution 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // Solution 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 */

class P52: XCTestCase {

    func totalNQueens(_ n: Int) -> Int {
        var solutions = 0
        
        var cols = Array(repeating: false, count: n)
        var master = Array(repeating: false, count: 2 * n - 1)
        var slave = Array(repeating: false, count: 2 * n - 1)
        
        func backtrack(_ row: Int) {
            if row == n {
                solutions += 1
                return
            }
            
            for col in 0..<n {
                if cols[col] { continue }
                if master[row + col] { continue }
                if slave[row - col + n - 1] { continue }
                
                cols[col] = true
                master[row + col] = true
                slave[row - col + n - 1] = true
                
                backtrack(row + 1)
                
                cols[col] = false
                master[row + col] = false
                slave[row - col + n - 1] = false
            }
        }
        
        backtrack(0)
        return solutions
    }
    
    func testTotalNQueens() {
        XCTAssertEqual(totalNQueens(4), 2)
    }

}
