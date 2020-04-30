// Created on 2020/4/6

import XCTest

/*
 https://leetcode-cn.com/problems/median-of-two-sorted-arrays/
 4. Median of Two Sorted Arrays
 There are two sorted arrays nums1 and nums2 of size m and n respectively.

 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

 You may assume nums1 and nums2 cannot be both empty.

 Example 1:

 nums1 = [1, 3]
 nums2 = [2]

 The median is 2.0
 Example 2:

 nums1 = [1, 2]
 nums2 = [3, 4]

 The median is (2 + 3)/2 = 2.5
 */

class P4: XCTestCase {

    // merge
    // T: O(n), S: O(n)
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var i = 0, j = 0, k = 0
        var nums = Array(repeating: 0, count: nums1.count + nums2.count)
        while i < nums1.count || j < nums2.count {
            if i < nums1.count && (j == nums2.count || nums1[i] <= nums2[j]) {
                nums[k] = nums1[i]
                i += 1
            } else {
                nums[k] = nums2[j]
                j += 1
            }
            k += 1
        }
        return k % 2 == 1 ? Double(nums[k / 2]) : (Double(nums[k / 2 - 1]) + Double(nums[k / 2])) * 0.5
    }
    
    // same idea of merge, but no need to merge actually
    // T: O(n), S: O(1)
    func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let len = nums1.count + nums2.count
        var i = 0, j = 0
        var prev = 0, curr = 0
        for _ in 0...len/2 {
            prev = curr
            if i < nums1.count && (j == nums2.count || nums1[i] <= nums2[j]) {
                curr = nums1[i]
                i += 1
            } else {
                curr = nums2[j]
                j += 1
            }
        }
        return len % 2 == 1 ? Double(curr) : (Double(prev) + Double(curr)) * 0.5
    }
    
    func findMedianSortedArrays3(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // TODO:
        return 0
    }
    
    let cases = [
        ([1, 2, 3], [4, 5, 6], 3.5),
        ([1, 3], [2], 2),
        ([1, 2], [3, 4], 2.5),
        ([1, 2], [], 1.5),
        ([], [1], 1),
        ([0, 0], [0, 0], 0)
    ]
    
    func testfindMedianSortedArrays() {
        for testcase in cases {
            let nums1 = testcase.0
            let nums2 = testcase.1
            XCTAssert(findMedianSortedArrays(nums1, nums2) == testcase.2)
        }
    }
    
    func testfindMedianSortedArrays2() {
        for testcase in cases {
            let nums1 = testcase.0
            let nums2 = testcase.1
            XCTAssert(findMedianSortedArrays2(nums1, nums2) == testcase.2)
        }
    }

}
