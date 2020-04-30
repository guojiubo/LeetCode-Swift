// Created on 2020/4/29

import XCTest

/*
 https://leetcode-cn.com/problems/find-in-mountain-array/
 1095. Find in Mountain Array
 (This problem is an interactive problem.)

 You may recall that an array A is a mountain array if and only if:

 A.length >= 3
 There exists some i with 0 < i < A.length - 1 such that:
 A[0] < A[1] < ... A[i-1] < A[i]
 A[i] > A[i+1] > ... > A[A.length - 1]
 Given a mountain array mountainArr, return the minimum index such that mountainArr.get(index) == target.  If such an index doesn't exist, return -1.

 You can't access the mountain array directly.  You may only access the array using a MountainArray interface:

 MountainArray.get(k) returns the element of the array at index k (0-indexed).
 MountainArray.length() returns the length of the array.
 Submissions making more than 100 calls to MountainArray.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.

  

 Example 1:

 Input: array = [1,2,3,4,5,3,1], target = 3
 Output: 2
 Explanation: 3 exists in the array, at index=2 and index=5. Return the minimum index, which is 2.
 Example 2:

 Input: array = [0,1,2,4,2,1], target = 3
 Output: -1
 Explanation: 3 does not exist in the array, so we return -1.
  

 Constraints:

 3 <= mountain_arr.length() <= 10000
 0 <= target <= 10^9
 0 <= mountain_arr.get(index) <= 10^9
 */

class P1095: XCTestCase {
    
    class MountainArray {
        let nums: [Int]
        
        init(_ nums: [Int]) {
            self.nums = nums
        }
        
        func get(_ index: Int) -> Int {
            return nums[index]
        }
        
        func length() -> Int {
            return nums.count
        }
    }
    
    func findMountainTop(_ mountainArr: MountainArray) -> Int {
        var left = 0, right = mountainArr.length() - 1
        while left < right {
            let mid = left + (right - left) / 2
            if mountainArr.get(mid) < mountainArr.get(mid + 1) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func binarySearch(_ target: Int, _ mountainArr: MountainArray, _ start: Int, _ end: Int, _ compare: (Int, Int) -> Bool) -> Int {
        var left = start, right = end
        while left <= right {
            let mid = left + (right - left) / 2
            let midValue = mountainArr.get(mid)
            if midValue == target {
                return mid
            }
            if compare(midValue, target) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }

    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        // find mountain top
        let top = findMountainTop(mountainArr)
        
        // search left side
        let result = binarySearch(target, mountainArr, 0, top, <)
        if result != -1 {
            return result
        }
        // search right side
        return binarySearch(target, mountainArr, top, mountainArr.length() - 1, >)
    }
    
    func testFindInMountainArray() {
        let m1 = MountainArray([1, 2, 3, 4, 5, 3, 1])
        XCTAssertEqual(findInMountainArray(3, m1), 2)
        
        let m2 = MountainArray([0, 1, 2, 4, 2, 1])
        XCTAssertEqual(findInMountainArray(3, m2), -1)
        
        let m3 = MountainArray([0, 1, 2, 4, 3, 1])
        XCTAssertEqual(findInMountainArray(3, m3), 4)
    }

}
