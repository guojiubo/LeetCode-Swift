// Created on 2020/4/8

import XCTest

/*
 https://leetcode-cn.com/problems/remove-element/
 27. Remove Element
 Given an array nums and a value val, remove all instances of that value in-place and return the new length.

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 The order of elements can be changed. It doesn't matter what you leave beyond the new length.

 Example 1:

 Given nums = [3,2,2,3], val = 3,

 Your function should return length = 2, with the first two elements of nums being 2.

 It doesn't matter what you leave beyond the returned length.
 Example 2:

 Given nums = [0,1,2,2,3,0,4,2], val = 2,

 Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.

 Note that the order of those five elements can be arbitrary.

 It doesn't matter what values are set beyond the returned length.
 Clarification:

 Confused why the returned value is an integer but your answer is an array?

 Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.

 Internally you can think of this:

 // nums is passed in by reference. (i.e., without making a copy)
 int len = removeElement(nums, val);

 // any modification to nums in your function would be known by the caller.
 // using the length returned by your function, it prints the first len elements.
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }
 */

class P27: XCTestCase {

    // move one by one, keep order
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for n in nums {
            if n != val {
                nums[i] = n
                i += 1
            }
        }
        return i
    }
    
    // erasure target, does not keep order
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var len = nums.count
        while i < len {
            if nums[i] == val {
                nums[i] = nums[len - 1]
                len -= 1
            } else {
                i += 1
            }
        }
        return len
    }
    
    func testRemoveElement() {
        var nums = [3,2,2,3]
        let len = removeElement(&nums, 3)
        XCTAssert(len == 2)
        for i in 0..<len {
            XCTAssert(nums[i] == 2)
        }
    }
    
    func testRemoveElement2() {
        var nums = [0,1,2,2,3,0,4,2]
        let len = removeElement2(&nums, 3)
        XCTAssert(len == 7)
        for i in 0..<len {
            XCTAssert(nums[i] != 3)
        }
    }

}
