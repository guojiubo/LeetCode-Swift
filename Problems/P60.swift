// Created on 2020/4/10

import XCTest

/*
 https://leetcode-cn.com/problems/permutation-sequence/
 60. Permutation Sequence
 The set [1,2,3,...,n] contains a total of n! unique permutations.

 By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 Given n and k, return the kth permutation sequence.

 Note:

 Given n will be between 1 and 9 inclusive.
 Given k will be between 1 and n! inclusive.
 Example 1:

 Input: n = 3, k = 3
 Output: "213"
 Example 2:

 Input: n = 4, k = 9
 Output: "2314"
 */

class P60: XCTestCase {
    
    // O(nk)
    func getPermutation(_ n: Int, _ k: Int) -> String {
        
        func nextPermutation(_ nums: inout [Int]) {
            func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
                var start = start, end = end
                while start < end {
                    nums.swapAt(start, end)
                    start += 1
                    end -= 1
                }
            }
            
            var i = nums.count - 2
            while i >= 0 && nums[i] >= nums[i + 1] {
                i -= 1
            }
            
            if i < 0 {
                nums.reverse()
                return
            }
            
            var j = nums.count - 1
            while j > i && nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
            
            reverse(&nums, i + 1, nums.count - 1)
        }
        
        var permutation = Array(1...n)
        for _ in 1..<k {
            nextPermutation(&permutation)
        }
        return permutation.reduce("", { "\($0)\($1)" })
    }
    
    func getPermutation2(_ n: Int, _ k: Int) -> String {
        var factors = Array(repeating: 1, count: n)
        for i in stride(from: 1, through: n - 1, by: 1) {
            factors[i] = i * factors[i - 1]
        }
        
        var k = k - 1
        
        var permutation = ""
        var nums = Array(1...n)
        for _ in 0..<n {
            let idx = k / factors[nums.count - 1]
            permutation += "\(nums[idx])"
            k -= idx * factors[nums.count - 1]
            nums.remove(at: idx)
        }
        return permutation
    }
    
    func testGetPermutation() {
        XCTAssertEqual(getPermutation(3, 3), "213")
        XCTAssertEqual(getPermutation(4, 9), "2314")
    }
    
    func testGetPermutation2() {
        XCTAssertEqual(getPermutation2(3, 3), "213")
        XCTAssertEqual(getPermutation2(4, 9), "2314")
    }

}
