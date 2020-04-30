// Created on 2020/4/14

import XCTest

/*
 https://leetcode-cn.com/problems/subsets-ii/
 90. Subsets II
 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: [1,2,2]
 Output:
 [
   [2],
   [1],
   [1,2,2],
   [2,2],
   [1,2],
   []
 ]
 */

class P90: XCTestCase {

    // [1, 2, 2] consider equal to [2, 2, 1] or [2, 1, 2]
    // so we must sort to skip duplicates
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        
        var subsets: [[Int]] = []
        var path: [Int] = []
        
        func backtrack(_ first: Int) {
            subsets.append(path)
            
            var used: Set<Int> = []
            for i in first..<nums.count {
                if used.contains(nums[i]) {
                    continue
                }
                path.append(nums[i])
                backtrack(i + 1)
                path.removeLast()
                used.insert(nums[i])
            }
        }
        
        backtrack(0)
        
        return subsets
    }
    
    func testSubsetsWithDup() {
        XCTAssertEqual(subsetsWithDup([2, 1, 2]).count, 6)
    }

}
