// Created on 2020/4/9

import XCTest

/*
 47. Permutations II
 Given a collection of numbers that might contain duplicates, return all possible unique permutations.

 Example:

 Input: [1,1,2]
 Output:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]
 */

class P47: XCTestCase {

    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var nums = nums
        
        func backtrack(_ first: Int) {
            if first == nums.count {
                result.append(nums)
                return
            }
            var used: Set<Int> = []
            for i in first..<nums.count {
                if used.contains(nums[i]) {
                    continue
                }
                nums.swapAt(first, i)
                backtrack(first + 1)
                nums.swapAt(first, i)
                used.insert(nums[i])
            }
        }
        
        backtrack(0)
        return result
    }
    
    func testPermuteUnique() {
        XCTAssertEqual(permuteUnique([1,1,2]).count, 3)
        XCTAssertEqual(permuteUnique([0,0,9,0,1]).count, 20)
    }

}
