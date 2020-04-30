// Created on 2020/4/4

import XCTest

/*
 https://leetcode-cn.com/problems/kth-largest-element-in-an-array/
 215. Kth Largest Element in an Array
 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Example 1:

 Input: [3,2,1,5,6,4] and k = 2
 Output: 5
 Example 2:

 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 */

class P215: XCTestCase {
    
    func findKthSmallest(_ nums: inout [Int], _ k: Int, _ left: Int, _ right: Int) -> Int {
        let pivot = nums[left]
        var lt = left
        for i in stride(from: left + 1, through: right, by: 1) {
            if nums[i] < pivot {
                lt += 1
                nums.swapAt(lt, i)
            }
        }
        nums.swapAt(left, lt)
        
        if lt == k  {
            return nums[lt]
        } else if (lt < k) {
            return findKthSmallest(&nums, k, lt + 1, right)
        } else {
            return findKthSmallest(&nums, k, left, lt - 1)
        }
    }

    // shuffle is nessssary bacause leetcode's testcases are almost sorted
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.shuffled()
        return findKthSmallest(&nums, nums.count - k, 0, nums.count - 1)
    }
    
    func testFindKthLargest() {
        XCTAssert(findKthLargest([3,2,1,5,6,4], 2) == 5)
        XCTAssert(findKthLargest([3,2,3,1,2,4,5,5,6], 4) == 4)
    }

}
