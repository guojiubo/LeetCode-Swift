// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/surrounded-regions/
 130. Surrounded Regions
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

 A region is captured by flipping all 'O's into 'X's in that surrounded region.

 Example:

 X X X X
 X O O X
 X X O X
 X O X X
 After running your function, the board should be:

 X X X X
 X X X X
 X X X X
 X O X X
 Explanation:

 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 */

class P130: XCTestCase {

    // DFS
    // start from all border "O"
    // mark cells that cannot be captured as "#"
    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        if i < 0 || i >= board.count || j < 0 || j >= board[0].count {
            return
        }
        if board[i][j] != "O" {
            return
        }
        board[i][j] = "#"
        dfs(&board, i - 1, j)
        dfs(&board, i + 1, j)
        dfs(&board, i, j - 1)
        dfs(&board, i, j + 1)
    }
    
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty || board[0].isEmpty {
            return
        }
        
        let m = board.count, n = board[0].count
        if m <= 2 || n <= 2 { return }
        
        for i in 0..<m {
            for j in 0..<n {
                if (i == 0 || i == m - 1 || j == 0 || j == n - 1) && board[i][j] == "O" {
                    dfs(&board, i, j)
                }
            }
        }
                
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "#" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func testSolve() {
        var board: [[Character]] = [
            ["X","O","X","O","X","O","O","O","X","O"],
            ["X","O","O","X","X","X","O","O","O","X"],
            ["O","O","O","O","O","O","O","O","X","X"],
            ["O","O","O","O","O","O","X","O","O","X"],
            ["O","O","X","X","O","X","X","O","O","O"],
            ["X","O","O","X","X","X","O","X","X","O"],
            ["X","O","X","O","O","X","X","O","X","O"],
            ["X","X","O","X","X","O","X","O","O","X"],
            ["O","O","O","O","X","O","X","O","X","O"],
            ["X","X","O","X","X","X","X","O","O","O"]
        ]
        solve(&board)
        XCTAssertEqual(board.description, """
        [["X", "O", "X", "O", "X", "O", "O", "O", "X", "O"], ["X", "O", "O", "X", "X", "X", "O", "O", "O", "X"], ["O", "O", "O", "O", "O", "O", "O", "O", "X", "X"], ["O", "O", "O", "O", "O", "O", "X", "O", "O", "X"], ["O", "O", "X", "X", "O", "X", "X", "O", "O", "O"], ["X", "O", "O", "X", "X", "X", "X", "X", "X", "O"], ["X", "O", "X", "X", "X", "X", "X", "O", "X", "O"], ["X", "X", "O", "X", "X", "X", "X", "O", "O", "X"], ["O", "O", "O", "O", "X", "X", "X", "O", "X", "O"], ["X", "X", "O", "X", "X", "X", "X", "O", "O", "O"]]
        """)
    }

}
