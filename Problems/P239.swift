// Created on 2020/4/27

import XCTest

/*
 https://leetcode-cn.com/problems/sliding-window-maximum/
 239. Sliding Window Maximum
 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.

 Follow up:
 Could you solve it in linear time?

 Example:

 Input: nums = [1,3,-1,-3,5,3,6,7], and k = 3
 Output: [3,3,5,5,6,7]
 Explanation:

 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 Constraints:

 1 <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 1 <= k <= nums.length
 */

class P239: XCTestCase {

    // Because we use array as deque, the complexity of 'removeFirst' is O(N), the total time complexity is O(N^2)
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var result: [Int] = []
        var deque: [Int] = []               // store index, not value
        
        // init deque
        for i in 0..<k {
            while !deque.isEmpty && nums[deque.last!] < nums[i] {
                deque.removeLast()
            }
            deque.append(i)
        }
        result.append(nums[deque.first!])
        
        
        for i in stride(from: k, to: nums.count, by: 1) {
            while !deque.isEmpty && nums[deque.last!] < nums[i] {
                deque.removeLast()
            }
            deque.append(i)
            
            if deque.first! <= i - k {      // not in the window
                deque.removeFirst()
            }
            
            result.append(nums[deque.first!])
        }
        
        return result
    }
    
    func testMaxSlidingWindow() {
        XCTAssertEqual(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3).description, "[3, 3, 5, 5, 6, 7]")
        XCTAssertEqual(maxSlidingWindow([1,3,-1,-3,-4,3,6,7], 3).description, "[3, 3, -1, 3, 6, 7]")
    }

}
