// Created on 2020/4/13

import XCTest

/*
 https://leetcode-cn.com/problems/largest-rectangle-in-histogram/
 84. Largest Rectangle in Histogram
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.

  


 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].

  


 The largest rectangle is shown in the shaded area, which has area = 10 unit.

  

 Example:

 Input: [2,1,5,6,2,3]
 Output: 10
 */

class P84: XCTestCase {

    // brute force, T: O(N^2), S: O(1)
    // expand around center
    // areas[i]: largest rectangle area with height equals to heights[i]
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var largest = 0
        for i in 0..<heights.count {
            var left = i, right = i
            while left > 0 && heights[left - 1] >= heights[i] {
                left -= 1
            }
            while right < heights.count - 1 && heights[right + 1] >= heights[i] {
                right += 1
            }
            let area = (right - left + 1) * heights[i]
            largest = max(largest, area)
        }
        return largest
    }
    
    // use stack to find nearest smaller height of left and right
    // for example:
    // 2   1   5   6   2   3
    //     i   ^       j
    // current height is 5
    // i points to the nearest smaller position of left hand
    // j points to the nearest smaller position of right hand
    // the largest rectangle area with height equals to 5 is 5 * (j - i - 1) = 10
    //
    // 2   1   5   6   2   3
    //         i   ^   j
    // current height is 6
    // the largest rectangle area with height equals to 6 is 6 * (j - i - 1) = 6
    //
    // all the following solutions are based on this idea
    
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        var stack: [(idx: Int, val: Int)] = []
        
        var rightSmaller = Array(repeating: heights.count, count: heights.count)
        for (idx, val) in heights.enumerated() {
            while !stack.isEmpty && stack.last!.val > val {
                let top = stack.removeLast()
                rightSmaller[top.idx] = idx
            }
            stack.append((idx, val))
        }
        
        stack = []
        
        var leftSmaller = Array(repeating: -1, count: heights.count)
        for (idx, val) in heights.enumerated().reversed() {
            while !stack.isEmpty && stack.last!.val > val {
                let top = stack.removeLast()
                leftSmaller[top.idx] = idx
            }
            stack.append((idx, val))
        }
        
        var largest = 0
        for (idx, val) in heights.enumerated() {
            let width = rightSmaller[idx] - leftSmaller[idx] - 1
            largest = max(largest, width * val)
        }
        return largest
    }
    
    // refactor of solution 2
    func largestRectangleArea3(_ heights: [Int]) -> Int {
        var stack: [(idx: Int, val: Int)] = []
        
        var leftSmaller = Array(repeating: -1, count: heights.count)
        var rightSmaller = Array(repeating: heights.count, count: heights.count)
        
        for (idx, val) in heights.enumerated() {
            while !stack.isEmpty && stack.last!.val > val {
                let top = stack.removeLast()
                rightSmaller[top.idx] = idx
            }
            if !stack.isEmpty {
                leftSmaller[idx] = stack.last!.idx
            }
            stack.append((idx, val))
        }
        
        var largest = 0
        for (idx, val) in heights.enumerated() {
            let width = rightSmaller[idx] - leftSmaller[idx] - 1
            largest = max(largest, width * val)
        }
        return largest
    }
    
    // refactor of solution 3
    func largestRectangleArea4(_ heights: [Int]) -> Int {
        var stack: [(idx: Int, val: Int)] = []

        var largest = 0
        for (idx, val) in heights.enumerated() {
            while !stack.isEmpty && stack.last!.val > val {
                let top = stack.removeLast()
                var left = -1
                if !stack.isEmpty {
                    left = stack.last!.idx
                }
                let right = idx
                let width = right - left - 1
                largest = max(largest, width * heights[top.idx])
            }
            stack.append((idx, val))
        }
        
        while !stack.isEmpty {              // all the elements in stack have no right smaller number
            let top = stack.removeLast()
            var left = -1
            if !stack.isEmpty {
                left = stack.last!.idx
            }
            let right = heights.count
            let width = right - left - 1
            largest = max(largest, width * heights[top.idx])
        }
        return largest
    }
    
    // refactor of solution 4
    func largestRectangleArea5(_ heights: [Int]) -> Int {
        var stack = [-1]
        var largest = 0
        for i in 0..<heights.count {
            while stack.count > 1 && heights[i] < heights[stack.last!] {
                let curr = stack.removeLast()
                let left = stack.last!, right = i
                let width = right - left - 1
                largest = max(largest, width * heights[curr])
            }
            stack.append(i)
        }
        while stack.count > 1 {     // all the elements in stack have no right smaller number
            let curr = stack.removeLast()
            let left = stack.last!, right = heights.count
            let width = right - left - 1
            largest = max(largest, width * heights[curr])
        }
        return largest
    }
    
    // refactor of solution 5
    func largestRectangleArea6(_ heights: [Int]) -> Int {
        var stack = [-1]
        var largest = 0
        for i in 0..<heights.count {
            while stack.count > 1 && heights[i] < heights[stack.last!] {
                let top = stack.removeLast()
                largest = max(largest, (i - stack.last! - 1) * heights[top])
            }
            stack.append(i)
        }
        while stack.count > 1 {     // all the elements in stack have no right smaller number
            let top = stack.removeLast()
            largest = max(largest, (heights.count - stack.last! - 1) * heights[top])
        }
        return largest
    }
    
    // https://leetcode-cn.com/problems/largest-rectangle-in-histogram/solution/zhu-zhuang-tu-zhong-zui-da-de-ju-xing-swift-shi-xi/
    // more clever solution
    func largestRectangleArea7(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        let heights = [0] + heights + [0]
        var largest = 0
        for i in 0..<heights.count {
            while let topIndex = stack.last, heights[topIndex] > heights[i] {
                stack.removeLast()
                largest = max(largest, (i - stack.last! - 1) * heights[topIndex])
            }
            stack.append(i)
        }
        return largest
    }
    
    func testLargestRectangleArea() {
        XCTAssertEqual(largestRectangleArea([]), 0)
        XCTAssertEqual(largestRectangleArea([2,1,5,6,2,3]), 10)
    }
    
    func testLargestRectangleArea2() {
        XCTAssertEqual(largestRectangleArea2([1,1]), 2)
        XCTAssertEqual(largestRectangleArea2([2,1,5,6,2,3]), 10)
    }
    
    func testLargestRectangleArea3() {
        XCTAssertEqual(largestRectangleArea3([1,1]), 2)
        XCTAssertEqual(largestRectangleArea3([2,1,5,6,2,3]), 10)
    }
    
    func testLargestRectangleArea4() {
        XCTAssertEqual(largestRectangleArea4([1]), 1)
        XCTAssertEqual(largestRectangleArea4([1,1]), 2)
        XCTAssertEqual(largestRectangleArea4([2,1,5,6,2,3]), 10)
    }
    
    func testLargestRectangleArea5() {
        XCTAssertEqual(largestRectangleArea5([1]), 1)
        XCTAssertEqual(largestRectangleArea5([1,1]), 2)
        XCTAssertEqual(largestRectangleArea5([2,1,5,6,2,3]), 10)
    }
    
    func testLargestRectangleArea6() {
        XCTAssertEqual(largestRectangleArea6([1]), 1)
        XCTAssertEqual(largestRectangleArea6([1,1]), 2)
        XCTAssertEqual(largestRectangleArea6([2,1,5,6,2,3]), 10)
    }

}
