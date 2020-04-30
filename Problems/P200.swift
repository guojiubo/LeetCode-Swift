// Created on 2020/4/18

import XCTest

/*
 https://leetcode-cn.com/problems/number-of-islands/
 200. Number of Islands
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input:
 11110
 11010
 11000
 00000

 Output: 1
 Example 2:

 Input:
 11000
 11000
 00100
 00011

 Output: 3
 */

class P200: XCTestCase {

    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        let m = grid.count, n = grid[0].count
        var grid = grid
        
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= m || j < 0 || j >= n {
                return
            }
            if grid[i][j] != "1" {
                return
            }
            grid[i][j] = "0"            // mark as visited
            dfs(i - 1, j)
            dfs(i + 1, j)
            dfs(i, j - 1)
            dfs(i, j + 1)
        }
        
        var num = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    dfs(i, j)           // after dfs, all islands connecting with current island ( grid[i][j] ) will be marked as visited
                    num += 1
                }
            }
        }
        return num
    }
    
    func testNumIsLands() {
        var grid: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        XCTAssertEqual(numIslands(grid), 1)
        
        grid = [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"]
        ]
        XCTAssertEqual(numIslands(grid), 3)
    }

}
