// Created on 2020/4/28

import XCTest

/*
 581. Shortest Unsorted Continuous Subarray
 Given an integer array, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.

 You need to find the shortest such subarray and output its length.

 Example 1:
 Input: [2, 6, 4, 8, 10, 9, 15]
 Output: 5
 Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
 Note:
 Then length of the input array is in range [1, 10,000].
 The input array may contain duplicates, so ascending order here means <=.
 */

class P581: XCTestCase {

    // BF, sort whole nums than compare with original
    // T: O(NlogN), S: O(N) for sorted copy
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        
        var start = -1, end = -1
        for i in 0..<nums.count where nums[i] != sorted[i] {
            if start == -1 {
                start = i
            } else {
                end = i
            }
        }
        return start == end ? 0 : end - start + 1
    }
    
    // T: O(N), S: O(N)
    func findUnsortedSubarray2(_ nums: [Int]) -> Int {
        var start = nums.count, end = -1
        var stack: [Int] = []
        
        for i in 0..<nums.count {
            while !stack.isEmpty && nums[i] < nums[stack.last!] {
                start = min(start, stack.removeLast())
            }
            stack.append(i)
        }
        
        if start == nums.count { return 0 } // all sorted
        
        stack = []
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            while !stack.isEmpty && nums[i] > nums[stack.last!] {
                end = max(end, stack.removeLast())
            }
            stack.append(i)
        }
        
        return end - start + 1
    }
    
    // https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray/solution/zui-duan-wu-xu-lian-xu-zi-shu-zu-by-leetcode/
    func findUnsortedSubarray3(_ nums: [Int]) -> Int {
        var unorderedMin = Int.max
        var unorderedMax = Int.min
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            if nums[i] < nums[i - 1] {
                unorderedMin = min(unorderedMin, nums[i])
            }
        }
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] > nums[i + 1] {
                unorderedMax = max(unorderedMax, nums[i])
            }
        }
        
        var start = 0, end = 0
        
        for i in 0..<nums.count {
            if nums[i] > unorderedMin {
                start = i
                break
            }
        }
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[i] < unorderedMax {
                end = i
                break
            }
        }
        
        return end == start ? 0 : end - start + 1
    }
    
    func testFindUnsortedSubarray() {
        XCTAssertEqual(findUnsortedSubarray([1, 1, 1]), 0)
        XCTAssertEqual(findUnsortedSubarray2([2, 6, 4, 8, 10, 9, 15]), 5)
        XCTAssertEqual(findUnsortedSubarray2([2, 6, 4, 8, 11, 9, 10]), 6)
        XCTAssertEqual(findUnsortedSubarray2([2, 6, 1, 8, 11, 9, 10]), 7)
    }
    
    func testFindUnsortedSubarray2() {
        XCTAssertEqual(findUnsortedSubarray2([1, 1, 1]), 0)
        XCTAssertEqual(findUnsortedSubarray2([1,3,5,4,2]), 4)
        XCTAssertEqual(findUnsortedSubarray2([2, 6, 4, 8, 10, 9, 15]), 5)
        XCTAssertEqual(findUnsortedSubarray2([2, 6, 4, 8, 11, 9, 10]), 6)
        XCTAssertEqual(findUnsortedSubarray2([2, 6, 1, 8, 11, 9, 10]), 7)
    }
    
    func testFindUnsortedSubarray3() {
        XCTAssertEqual(findUnsortedSubarray3([1, 1, 1]), 0)
        XCTAssertEqual(findUnsortedSubarray3([1,3,5,4,2]), 4)
        XCTAssertEqual(findUnsortedSubarray3([2, 6, 4, 8, 10, 9, 15]), 5)
        XCTAssertEqual(findUnsortedSubarray3([2, 6, 4, 8, 11, 9, 10]), 6)
        XCTAssertEqual(findUnsortedSubarray3([2, 6, 1, 8, 11, 9, 10]), 7)
    }

}
