// Created on 2020/4/21

import XCTest

/*
 https://leetcode-cn.com/problems/contains-duplicate/
 217. Contains Duplicate
 Given an array of integers, find if the array contains any duplicates.

 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

 Example 1:

 Input: [1,2,3,1]
 Output: true
 Example 2:

 Input: [1,2,3,4]
 Output: false
 Example 3:

 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */

class P217: XCTestCase {

    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        for n in nums {
            if set.contains(n) {
                return true
            }
            set.insert(n)
        }
        return false
    }
    
    func testContainsDuplicate() {
        XCTAssertTrue(containsDuplicate([1,2,3,1]))
        XCTAssertFalse(containsDuplicate([1,2,3,4]))
        XCTAssertTrue(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
    }

}
