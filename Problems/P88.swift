// Created on 2020/4/8

import XCTest

/*
 https://leetcode-cn.com/problems/merge-sorted-array/
 88. Merge Sorted Array
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 Note:

 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 Example:

 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]
 */

class P88: XCTestCase {
    
    // from back to front
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var k = m + n - 1
        var i = m - 1, j = n - 1
        while i >= 0 && j >= 0 {
            if nums1[i] >= nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
    }
    
    // same solution but shorter
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var k = m + n - 1
        var i = m - 1, j = n - 1
        while k >= 0 {
            if j == -1 || nums1[i] >= nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
    }
    
    func testMerge() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        merge(&nums1, 3, nums2, 3)
        XCTAssertEqual(nums1.description, "[1, 2, 2, 3, 5, 6]")
    }
    
    func testMerge2() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        merge2(&nums1, 3, nums2, 3)
        XCTAssertEqual(nums1.description, "[1, 2, 2, 3, 5, 6]")
    }

}
