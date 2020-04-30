// Created on 2020/4/20

import XCTest

/*
 https://leetcode-cn.com/problems/largest-number/
 179. Largest Number
 Given a list of non negative integers, arrange them such that they form the largest number.

 Example 1:

 Input: [10,2]
 Output: "210"
 Example 2:

 Input: [3,30,34,5,9]
 Output: "9534330"
 Note: The result may be very large, so you need to return a string instead of an integer.
 */

class P179: XCTestCase {

    func largestNumber(_ nums: [Int]) -> String {
        if nums.isEmpty {
            return ""
        }
        let sorted = nums.map{ String($0) }.sorted(by: { $0 + $1 > $1 + $0 })
        if sorted[0] == "0" {   // numbers are all zero
            return "0"
        }
        return sorted.joined()
    }
    
    func testLargestNumber() {
        print(["90", "92", "9"].sorted(by: {
            return $0 + $1 > $1 + $0
        }))
        XCTAssertEqual(largestNumber([10,2]), "210")
        XCTAssertEqual(largestNumber([3,30,34,5,9]), "9534330")
    }

}
