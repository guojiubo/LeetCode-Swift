// Created on 2020/4/26

import XCTest

/*
 https://leetcode-cn.com/problems/n-queens/
 51. N-Queens
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

 Example:

 Input: 4
 Output: [
  [".Q..",  // Solution 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // Solution 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 */

class P51: XCTestCase {

    func solveNQueens(_ n: Int) -> [[String]] {
        var solutions: [[String]] = []
        
        // cols and master/slave diagonals already been taken
        //
        var cols = Array(repeating: false, count: n)
        // range of row + col, which is 0...(2 * n - 1)
        var master = Array(repeating: false, count: 2 * n - 1)
        // range of row - col, which is -(n - 1)...(n - 1)
        var slave = Array(repeating: false, count: 2 * n - 1)
        
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        func backtrack(_ row: Int) {
            if row == n {
                solutions.append(board.map{ $0.joined() })
                return
            }
            
            for col in 0..<n {
                if cols[col] { continue }
                if master[row + col] { continue }
                if slave[row - col + n - 1] { continue }
                
                cols[col] = true
                master[row + col] = true
                slave[row - col + n - 1] = true
                
                board[row][col] = "Q"
                
                backtrack(row + 1)
                
                board[row][col] = "."
                
                cols[col] = false
                master[row + col] = false
                slave[row - col + n - 1] = false
            }
        }
        
        backtrack(0)
        
        return solutions
    }
    
    func testSolveNQueens() {
        XCTAssertEqual(solveNQueens(4).description, """
        [[".Q..", "...Q", "Q...", "..Q."], ["..Q.", "Q...", "...Q", ".Q.."]]
        """)
    }

}
