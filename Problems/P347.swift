// Created on 2020/4/4

import XCTest

/*
 347. Top K Frequent Elements
 Given a non-empty array of integers, return the k most frequent elements.

 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
 Note:

 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 */

class P347: XCTestCase {
    
    // notice: the output element's order is undefined if they have equal frequency
    
    // T: O(nlogn), S: O(n)
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for n in nums {
            map[n, default: 0] += 1
        }
        let sorted = Set(nums).sorted(by: { map[$0]! > map[$1]! })
        return Array(sorted[0..<k])
    }
    
    // bucket sort
    // T: O(n), S: O(n)
    func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for n in nums {
            map[n, default: 0] += 1
        }
        
        // bucket[i] = [x, y] means: x, y has frequency of i
        var bucket: [[Int]] = Array(repeating: [], count: nums.count + 1)
        for (k, v) in map {
            bucket[v].append(k)
        }
        
        var result: [Int] = []
        var i = bucket.count - 1
        while i > 0 && result.count < k {
            if !bucket[i].isEmpty {
                result.append(contentsOf: bucket[i])
            }
            i -= 1
        }
        return result
    }
    
    func testTopKFrequent() {
        let result = topKFrequent([1,1,1,2,2,3], 2)
        XCTAssert(result[0] == 1)
        XCTAssert(result[1] == 2)
    }

    func testTopKFrequent2() {
        let result = topKFrequent2([1,1,1,2,2,3], 2)
        XCTAssert(result[0] == 1)
        XCTAssert(result[1] == 2)
    }
}
