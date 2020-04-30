// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/maximum-subarray/
 53. Maximum Subarray
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

class P53: XCTestCase {

    // T: O(n), S: O(n)
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var dp = nums
        var maxSum = nums[0]
        for i in stride(from: 1, to: nums.count, by: 1) {
            dp[i] = max(dp[i - 1] + nums[i], nums[i])
            maxSum = max(maxSum, dp[i])
        }
        return maxSum
    }
    
    // T: O(n), S: O(1)
    func maxSubArray2(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var prev = nums[0]
        var maxSum = nums[0]
        for i in stride(from: 1, to: nums.count, by: 1) {
            prev = max(prev + nums[i], nums[i])
            maxSum = max(maxSum, prev)
        }
        return maxSum
    }
    
    // Divide an conquer
    // O(NlogN)
    func maxSubArray3(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        func maxSum(_ start: Int, _ end: Int) -> Int {
            if start == end {
                return nums[start]
            }
            
            let mid = start + (end - start) / 2
            let leftMaxSum = maxSum(start, mid)
            let rightMaxSum = maxSum(mid + 1, end)
            
            var leftCrossSum = 0, leftCrossMax = Int.min
            for i in stride(from: mid, through: start, by: -1) {        // mid -> left, including nums[mid]
                leftCrossSum += nums[i]
                leftCrossMax = max(leftCrossMax, leftCrossSum)
            }
            var rightCrossSum = 0, rightCrossMax = Int.min
            for i in stride(from: mid + 1, through: end, by: 1) {       // mid + 1 -> right, including nums[mid + 1]
                rightCrossSum += nums[i]
                rightCrossMax = max(rightCrossMax, rightCrossSum)
            }
            
            let crossSum = leftCrossMax + rightCrossMax
            return max(max(leftMaxSum, rightMaxSum), crossSum)
        }
        
        return maxSum(0, nums.count - 1)
    }
    
    func testMaxSubArray() {
        XCTAssertEqual(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6)
    }
    
    func testMaxSubArray2() {
        XCTAssertEqual(maxSubArray2([-2,1,-3,4,-1,2,1,-5,4]), 6)
    }
    
    func testMaxSubArray3() {
        XCTAssertEqual(maxSubArray3([-2,1,-3,4,-1,2,1,-5,4]), 6)
    }

}
