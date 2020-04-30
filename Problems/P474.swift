// Created on 2020/4/24

import XCTest

/*
 https://leetcode-cn.com/problems/ones-and-zeroes/
 474. Ones and Zeroes
 In the computer world, use restricted resource you have to generate maximum benefit is what we always want to pursue.

 For now, suppose you are a dominator of m 0s and n 1s respectively. On the other hand, there is an array with strings consisting of only 0s and 1s.

 Now your task is to find the maximum number of strings that you can form with given m 0s and n 1s. Each 0 and 1 can be used at most once.

 Note:

 The given numbers of 0s and 1s will both not exceed 100
 The size of given string array won't exceed 600.
  

 Example 1:

 Input: Array = {"10", "0001", "111001", "1", "0"}, m = 5, n = 3
 Output: 4

 Explanation: This are totally 4 strings can be formed by the using of 5 0s and 3 1s, which are “10,”0001”,”1”,”0”
  

 Example 2:

 Input: Array = {"10", "0", "1"}, m = 1, n = 1
 Output: 2

 Explanation: You could form "10", but then you'd have nothing left. Better form "0" and "1".
 */

class P474: XCTestCase {

    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var counts: [(Int, Int)] = []
        for s in strs {
            var zero = 0, one = 0
            for c in s {
                if c == "0" {
                    zero += 1
                }
                else {
                    one += 1
                }
            }
            counts.append((zero, one))
        }
        
        var memo: [String: Int] = [:]
        
        func dfs(_ index: Int, _ zero: Int, _ one: Int) -> Int {
            if index == 0 {
                return zero >= counts[0].0 && one >= counts[0].1 ? 1 : 0
            }
            if index < 0 || zero < 0 || one < 0 {
                return 0
            }
            
            let key = "\(index)_\(zero)_\(one)"
            if memo[key] != nil {
                return memo[key]!
            }
            
            if zero >= counts[index].0 && one >= counts[index].1 {
                memo[key] = max(1 + dfs(index - 1, zero - counts[index].0, one - counts[index].1), dfs(index - 1, zero, one))
            } else {
                memo[key] = dfs(index - 1, zero, one)
            }
            return memo[key]!
        }
        
        return dfs(strs.count - 1, m, n)
    }
    
    // bottom-up 3-D DP solution
    // dp[i][j][k] = max(
    //                  dp[i - 1][j][k],
    //                  1 + dp[i - 1][j - strs[i].zeros][k - strs[i].ones], if j >= strs[i].zeros && k >= strs[i].ones)
    //               )
    func findMaxForm2(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1), count: strs.count + 1)
        
        for i in 1..<strs.count + 1 {
            var zeros = 0, ones = 0
            for c in strs[i - 1] {
                if c == "0" { zeros += 1 }
                else        { ones += 1 }
            }
            
            for j in 0...m {
                for k in 0...n {
                    dp[i][j][k] = dp[i - 1][j][k]
                    if j >= zeros && k >= ones {
                        dp[i][j][k] = max(dp[i][j][k], 1 + dp[i - 1][j - zeros][k - ones])
                    }
                }
            }
        }
        
        return dp[strs.count][m][n]
    }
    
    // bottom-up 2-D DP solution
    func findMaxForm3(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for s in strs {
            var zeros = 0, ones = 0
            for c in s {
                if c == "0" { zeros += 1 }
                else        { ones += 1 }
            }
            
            for j in stride(from: m, through: 0, by: -1) {
                for k in stride(from: n, through: 0, by: -1) {
                    if j >= zeros && k >= ones {
                        dp[j][k] = max(dp[j][k], 1 + dp[j - zeros][k - ones])
                    }
                }
            }
        }
        
        return dp[m][n]
    }
    
    func testFindMaxForm() {
        XCTAssertEqual(findMaxForm(["10", "0001", "111001", "1", "0"], 5, 3), 4)
        XCTAssertEqual(findMaxForm(["10", "0", "1"], 1, 1), 2)
    }
    
    func testFindMaxForm2() {
        XCTAssertEqual(findMaxForm2(["10", "0001", "111001", "1", "0"], 5, 3), 4)
        XCTAssertEqual(findMaxForm2(["10", "0", "1"], 1, 1), 2)
    }
    
    func testFindMaxForm3() {
        XCTAssertEqual(findMaxForm3(["10", "0001", "111001", "1", "0"], 5, 3), 4)
        XCTAssertEqual(findMaxForm3(["10", "0", "1"], 1, 1), 2)
    }

}
