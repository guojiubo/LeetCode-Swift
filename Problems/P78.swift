// Created on 2020/4/11

import XCTest

/*
 https://leetcode-cn.com/problems/subsets/
 78. Subsets
 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: nums = [1,2,3]
 Output:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 */

class P78: XCTestCase {

    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var path: [Int] = []
        
        func backtrack(_ index: Int) {
            result.append(path)
            for i in index..<nums.count {
                path.append(nums[i])
                backtrack(i + 1)
                path.removeLast()
            }
        }
        
        backtrack(0)
        return result
    }
    
    // 1, 2, 3, 4, 5
    // 1  0  1  0  0 -> [1, 3]
    // 0  0  0  0  1 -> [5]
    func subsets2(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let total = 1 << nums.count
        for mask in 0..<total {
            var subset: [Int] = []
            for i in 0..<nums.count {
                if (1 << i) & mask != 0 {
                    subset.append(nums[i])
                }
            }
            result.append(subset)
        }
        return result
    }
    
    func testSubsets() {
        XCTAssertEqual(subsets([1, 2, 3]).count, 8)
    }
    
    func testSubsets2() {
        XCTAssertEqual(subsets2([1, 2, 3]).count, 8)
    }

}
