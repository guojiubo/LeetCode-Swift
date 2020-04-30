// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/combination-sum/
 39. Combination Sum
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
   [7],
   [2,2,3]
 ]
 Example 2:

 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 */

class P39: XCTestCase {

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        func backtrack(_ path: [Int], _ first: Int, _ sum: Int) {
            if sum > target {
                return
            }
            if sum == target {
                result.append(path)
                return
            }
            for i in first..<candidates.count {
                backtrack(path + [candidates[i]], i, sum + candidates[i])
            }
        }
        backtrack([], 0, 0)
        return result
    }
    
    func testCombinationSum() {
        XCTAssertEqual(combinationSum([2,3,6,7], 7).count, 2)
        XCTAssertEqual(combinationSum([2,3,5], 8).count, 3)
    }

}
