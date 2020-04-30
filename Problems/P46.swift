// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/permutations/
 46. Permutations
 Given a collection of distinct integers, return all possible permutations.

 Example:

 Input: [1,2,3]
 Output:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 */

class P46: XCTestCase {

    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var nums = nums
        
        func backtrack(_ first: Int) {
            if first == nums.count {
                result.append(nums)
                return
            }
            for i in first..<nums.count {
                nums.swapAt(first, i)
                backtrack(first + 1)
                nums.swapAt(first, i)
            }
        }
        
        backtrack(0)
        return result
    }
    
    func testPermute() {
        XCTAssertEqual(permute([1,2,3]).count, 6)
    }

}
