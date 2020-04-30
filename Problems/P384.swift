// Created on 2020/4/28

import XCTest

/*
 https://leetcode-cn.com/problems/shuffle-an-array/
 384. Shuffle an Array
 Shuffle a set of numbers without duplicates.

 Example:

 // Init an array with set 1, 2, and 3.
 int[] nums = {1,2,3};
 Solution solution = new Solution(nums);

 // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
 solution.shuffle();

 // Resets the array back to its original configuration [1,2,3].
 solution.reset();

 // Returns the random shuffling of array [1,2,3].
 solution.shuffle();
 */

class P384: XCTestCase {
    
    class Solution {
        
        private let nums: [Int]

        init(_ nums: [Int]) {
            self.nums = nums
        }
        
        /** Resets the array to its original configuration and return it. */
        func reset() -> [Int] {
            return nums
        }
        
        /** Returns a random shuffling of the array. */
        func shuffle() -> [Int] {
            var shuffled = self.nums
            for i in 0..<shuffled.count {
                let random = Int.random(in: i..<shuffled.count)
                shuffled.swapAt(i, random)
            }
            return shuffled
        }
    }

    func testShuffle() {
        let solution = Solution([1, 2, 3, 4, 5])
        print(solution.shuffle())
        print(solution.reset())
    }

}
