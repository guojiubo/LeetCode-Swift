// Created on 2020/4/24

import XCTest

/*
 https://leetcode-cn.com/problems/shu-zu-zhong-de-ni-xu-dui-lcof/
 面试题51. 数组中的逆序对
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

  

 示例 1:

 输入: [7,5,6,4]
 输出: 5
  

 限制：

 0 <= 数组长度 <= 50000
 */

class LCOF51: XCTestCase {

    func reversePairs(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        var nums = nums
        var temp = Array(repeating: 0, count: nums.count)
        return reversePairs(&nums, 0, nums.count - 1, &temp)
    }
    
    func reversePairs(_ nums: inout [Int], _ left: Int, _ right: Int, _ temp: inout [Int]) -> Int {
        if left == right {
            return 0
        }
        
        let mid = left + (right - left) / 2
        let leftPairs = reversePairs(&nums, left, mid, &temp)
        let rightPairs = reversePairs(&nums, mid + 1, right, &temp)
        
        if nums[mid] <= nums[mid + 1] {
            return leftPairs + rightPairs
        }
        
        let crossPairs = mergeAndCount(&nums, left, mid, right, &temp)
        return leftPairs + crossPairs + rightPairs
    }
    
    func mergeAndCount(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int, _ temp: inout [Int]) -> Int {
        if left == right {
            return 0
        }
        
        for i in left...right {
            temp[i] = nums[i]
        }
        
        var pairs = 0
        var i = left, j = mid + 1
        for k in left...right {
            if i > mid {
                nums[k] = temp[j]
                j += 1
            } else if j > right {
                nums[k] = temp[i]
                i += 1
            } else if temp[i] <= temp[j] {
                nums[k] = temp[i]
                i += 1
            } else {
                nums[k] = temp[j]
                j += 1
                pairs += mid - i + 1
            }
        }
        return pairs
    }
    
    func testReversePairs() {
        XCTAssertEqual(reversePairs([7,5,6,4]), 5)
    }

}
