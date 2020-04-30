// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/unique-paths-ii/
 63. Unique Paths II
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 Now consider if some obstacles are added to the grids. How many unique paths would there be?



 An obstacle and empty space is marked as 1 and 0 respectively in the grid.

 Note: m and n will be at most 100.

 Example 1:

 Input:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 Output: 2
 Explanation:
 There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right
 */

class P63: XCTestCase {

    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty || obstacleGrid[0].isEmpty {
            return 0
        }
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        let m = obstacleGrid.count, n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[0][0] = 1
        for i in 1..<m {
            dp[i][0] = obstacleGrid[i][0] == 1 ? 0 : dp[i - 1][0]
        }
        for j in 1..<n {
            dp[0][j] = obstacleGrid[0][j] == 1 ? 0 : dp[0][j - 1]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func uniquePathsWithObstacles2(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count, n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[0][0] = obstacleGrid[0][0] == 1 ? 0 : 1
        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    continue
                }
                if i > 0 {
                    dp[i][j] += dp[i - 1][j]
                }
                if j > 0 {
                    dp[i][j] += dp[i][j - 1]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func testUniquePathsWithObstacles() {
        var grid = [
          [0,0,0],
          [0,1,0],
          [0,0,0]
        ]
        XCTAssertEqual(uniquePathsWithObstacles(grid), 2)
        
        grid = [
          [1]
        ]
        XCTAssertEqual(uniquePathsWithObstacles(grid), 0)
    }
    
    func testUniquePathsWithObstacles2() {
        var grid = [
          [0,0,0],
          [0,1,0],
          [0,0,0]
        ]
        XCTAssertEqual(uniquePathsWithObstacles2(grid), 2)
        
        grid = [
          [1]
        ]
        XCTAssertEqual(uniquePathsWithObstacles2(grid), 0)
    }

}
