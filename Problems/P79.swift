// Created on 2020/4/12

import XCTest

/*
 https://leetcode-cn.com/problems/word-search/
 79. Word Search
 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example:

 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]

 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
  

 Constraints:

 board and word consists only of lowercase and uppercase English letters.
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 1 <= word.length <= 10^3
 */

class P79: XCTestCase {

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty || board[0].isEmpty {
            return false
        }
        
        let chars = Array(word)
        let m = board.count, n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        func backtrack(_ i: Int, _ j: Int, _ index: Int) -> Bool {
            if index == chars.count {
                return true
            }
            if i < 0 || i >= m || j < 0 || j >= n {
                return false
            }
            if visited[i][j] || board[i][j] != chars[index] {
                return false
            }
            
            visited[i][j] = true
            defer {
                visited[i][j] = false
            }
            return
                backtrack(i - 1, j, index + 1) ||
                backtrack(i + 1, j, index + 1) ||
                backtrack(i, j - 1, index + 1) ||
                backtrack(i, j + 1, index + 1)
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if backtrack(i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func testExist() {
        let board: [[Character]] =
        [
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ]
        XCTAssertEqual(exist(board, "ABCCED"), true)
        XCTAssertEqual(exist(board, "SEE"), true)
        XCTAssertEqual(exist(board, "ABCB"), false)
    }

}
