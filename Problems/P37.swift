// Created on 2020/4/25

import XCTest

/*
 https://leetcode-cn.com/problems/sudoku-solver/
 37. Sudoku Solver
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 Empty cells are indicated by the character '.'.


 A sudoku puzzle...


 ...and its solution numbers marked in red.

 Note:

 The given board contain only digits 1-9 and the character '.'.
 You may assume that the given Sudoku puzzle will have a single unique solution.
 The given board size is always 9x9.
 */

class P37: XCTestCase {

    func solveSudoku(_ board: inout [[Character]]) {
        var rows = Array(repeating: Array(repeating: 0, count: 10), count: 9)
        var boxes = Array(repeating: Array(repeating: 0, count: 10), count: 9)
        var cols = Array(repeating: Array(repeating: 0, count: 10), count: 9)
        
        for row in 0..<9 {
            for col in 0..<9 where board[row][col] != "." {
                let n = Int(String(board[row][col]))!
                let box = (row / 3) * 3 + (col / 3)
                rows[row][n] = n
                cols[col][n] = n
                boxes[box][n] = n
            }
        }
        
        var solved = false
        
        func backtrack(_ board: inout [[Character]], _ row: Int, _ col: Int) {
            if row == 9 {
                solved = true
                return
            }
            
            let (nextRow, nextCol) = (col == 8) ? (row + 1, 0) : (row, col + 1)

            if board[row][col] != "." {
                backtrack(&board, nextRow, nextCol)
                return
            }
            
            for n in 1...9 {
                if rows[row][n] != 0 { continue }
                if cols[col][n] != 0 { continue }
                let box = (row / 3) * 3 + col / 3
                if boxes[box][n] != 0 { continue }

                rows[row][n] = n
                cols[col][n] = n
                boxes[box][n] = n

                board[row][col] = Character(String(n))

                backtrack(&board, nextRow, nextCol)
                
                if !solved {
                    board[row][col] = "."

                    rows[row][n] = 0
                    cols[col][n] = 0
                    boxes[box][n] = 0
                }
            }
        }
        
        backtrack(&board, 0, 0)
    }
    
    func testSolveSudoku() {
        var board: [[Character]] = [
          ["5","3",".",".","7",".",".",".","."],
          ["6",".",".","1","9","5",".",".","."],
          [".","9","8",".",".",".",".","6","."],
          ["8",".",".",".","6",".",".",".","3"],
          ["4",".",".","8",".","3",".",".","1"],
          ["7",".",".",".","2",".",".",".","6"],
          [".","6",".",".",".",".","2","8","."],
          [".",".",".","4","1","9",".",".","5"],
          [".",".",".",".","8",".",".","7","9"]
        ]
        solveSudoku(&board)
        XCTAssertEqual(board.description, """
        [["5", "3", "4", "6", "7", "8", "9", "1", "2"], ["6", "7", "2", "1", "9", "5", "3", "4", "8"], ["1", "9", "8", "3", "4", "2", "5", "6", "7"], ["8", "5", "9", "7", "6", "1", "4", "2", "3"], ["4", "2", "6", "8", "5", "3", "7", "9", "1"], ["7", "1", "3", "9", "2", "4", "8", "5", "6"], ["9", "6", "1", "5", "3", "7", "2", "8", "4"], ["2", "8", "7", "4", "1", "9", "6", "3", "5"], ["3", "4", "5", "2", "8", "6", "1", "7", "9"]]
        """)
    }

}
