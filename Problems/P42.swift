// Created on 2020/4/4

import XCTest

/*
 https://leetcode-cn.com/problems/trapping-rain-water/
 42. Trapping Rain Water
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.


 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

 Example:

 Input: [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 */

class P42: XCTestCase {

    // consider how many water can a bar trap
    // it depends on it's left hand highest bar and right hand highest bar
    // water = min(leftHighest, rightHighest) - height[i]
    func trap(_ height: [Int]) -> Int {
        var leftHighest = Int.min, rightHighest = Int.min
        var i = 0, j = height.count - 1
        var water = 0
        while i < j {
            leftHighest = max(leftHighest, height[i])
            rightHighest = max(rightHighest, height[j])
            if leftHighest < rightHighest {
                water += leftHighest - height[i]
                i += 1
            } else {
                water += rightHighest - height[j]
                j -= 1
            }
        }
        return water
    }
    
    // DP, the most obvious solution
    // use two array to store each left highest and each right highest
    func trap2(_ height: [Int]) -> Int {
        if height.isEmpty { return 0 }
        
        var leftHighest = height, rightHighest = height
        for i in 1..<height.count {
            leftHighest[i] = max(leftHighest[i], leftHighest[i - 1])
            let j = height.count - i - 1
            rightHighest[j] = max(rightHighest[j], rightHighest[j + 1])
        }
        
        var water = 0
        for i in 0..<height.count {
            water += min(leftHighest[i], rightHighest[i]) - height[i]
        }
        return water
    }
    
    func testTrap() {
        XCTAssert(trap([]) == 0)
        XCTAssert(trap([1]) == 0)
        XCTAssert(trap([1,2]) == 0)
        XCTAssert(trap([2,3,1]) == 0)
        XCTAssert(trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6)
    }
    
    func testTrap2() {
        XCTAssert(trap2([]) == 0)
        XCTAssert(trap2([1]) == 0)
        XCTAssert(trap2([1,2]) == 0)
        XCTAssert(trap2([2,3,1]) == 0)
        XCTAssert(trap2([0,1,0,2,1,0,1,3,2,1,2,1]) == 6)
    }

}
