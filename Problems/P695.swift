// Created on 2020/4/18

import XCTest

/*
 https://leetcode-cn.com/problems/max-area-of-island/
 695. Max Area of Island
 Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

 Example 1:

 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,1,1,1,0,0,0],
  [0,1,1,0,1,0,0,0,0,0,0,0,0],
  [0,1,0,0,1,1,0,0,1,0,1,0,0],
  [0,1,0,0,1,1,0,0,1,1,1,0,0],
  [0,0,0,0,0,0,0,0,0,0,1,0,0],
  [0,0,0,0,0,0,0,1,1,1,0,0,0],
  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
 Example 2:

 [[0,0,0,0,0,0,0,0]]
 Given the above grid, return 0.
 Note: The length of each dimension in the given grid does not exceed 50.
 */

class P695: XCTestCase {

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        let m = grid.count, n = grid[0].count
        var grid = grid
        
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i < 0 || i >= m || j < 0 || j >= n {
                return 0
            }
            if grid[i][j] == 0 {
                return 0
            }
            
            grid[i][j] = 0      // mark as visited
            
            return 1 + dfs(i - 1, j) + dfs(i + 1, j) + dfs(i, j - 1) + dfs(i, j + 1)
        }
        
        var maxArea = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    maxArea = max(maxArea, dfs(i, j))
                }
            }
        }
        return maxArea
    }
    
    func testMaxAreaOfIsland() {
        var grid = [
            [0,0,1,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,1,1,0,1,0,0,0,0,0,0,0,0],
            [0,1,0,0,1,1,0,0,1,0,1,0,0],
            [0,1,0,0,1,1,0,0,1,1,1,0,0],
            [0,0,0,0,0,0,0,0,0,0,1,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,0,0,0,0,0,0,1,1,0,0,0,0]
        ]
        XCTAssertEqual(maxAreaOfIsland(grid), 6)
        
        grid = [[0,0,0,0,0,0,0,0]]
        XCTAssertEqual(maxAreaOfIsland(grid), 0)
    }

}
