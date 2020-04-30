// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/combination-sum-ii/
 40. Combination Sum II
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 Each number in candidates may only be used once in the combination.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
   [1, 7],
   [1, 2, 5],
   [2, 6],
   [1, 1, 6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
   [1,2,2],
   [5]
 ]
 */

class P40: XCTestCase {

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        
        var result: [[Int]] = []
        
        func backtrack(_ path: [Int], _ first: Int, _ sum: Int) {
            if sum == target {
                result.append(path)
                return
            }
            if sum > target {
                return
            }
            var used: Set<Int> = []
            for i in first..<candidates.count {
                let n = candidates[i]
                if used.contains(n) {
                    continue
                }
                backtrack(path + [n], i + 1, sum + n)
                used.insert(n)
            }
        }
        
        backtrack([], 0, 0)
        return result
    }
    
    func combinationSum22(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        
        var result: [[Int]] = []
        
        func backtrack(_ path: [Int], _ first: Int, _ sum: Int) {
            if sum == target {
                result.append(path)
                return
            }
            if sum > target {
                return
            }
            for i in first..<candidates.count {
                let n = candidates[i]
                if i > first && candidates[i - 1] == n {
                    continue
                }
                backtrack(path + [n], i + 1, sum + n)
            }
        }
        
        backtrack([], 0, 0)
        return result
    }
    
    func testCombinationSum2() {
        XCTAssertEqual(combinationSum2([10,1,2,7,6,1,5], 8).count, 4)
        XCTAssertEqual(combinationSum2([2,5,2,1,2], 5).count, 2)
    }
    
    func testCombinationSum22() {
        XCTAssertEqual(combinationSum22([10,1,2,7,6,1,5], 8).count, 4)
        XCTAssertEqual(combinationSum22([2,5,2,1,2], 5).count, 2)
    }

}
