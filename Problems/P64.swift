// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/minimum-path-sum/
 64. Minimum Path Sum
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.

 Example:

 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 */

class P64: XCTestCase {

    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }
        let m = grid.count, n = grid[0].count
        var dp = grid
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    dp[i][j] = grid[i][j]
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1] + grid[i][j]
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func testMinPathSum() {
        let grid = [
          [1,3,1],
          [1,5,1],
          [4,2,1]
        ]
        XCTAssertEqual(minPathSum(grid), 7)
    }

}
