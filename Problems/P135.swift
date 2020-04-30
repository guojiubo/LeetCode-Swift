// Created on 2020/4/17

import XCTest

/*
 https://leetcode-cn.com/problems/candy/
 135. Candy
 There are N children standing in a line. Each child is assigned a rating value.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 What is the minimum candies you must give?

 Example 1:

 Input: [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 Example 2:

 Input: [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
              The third child gets 1 candy because it satisfies the above two conditions.
 */

class P135: XCTestCase {

    func candy(_ ratings: [Int]) -> Int {
        if ratings.count < 2 {
            return ratings.count
        }
        
        var candies = Array(repeating: 1, count: ratings.count)
        
        for i in stride(from: 1, to: ratings.count, by: 1) {
            if ratings[i] > ratings[i - 1] {
                candies[i] = 1 + candies[i - 1]
            }
        }
        
        for i in stride(from: ratings.count - 2, through: 0, by: -1) {
            if ratings[i] > ratings[i + 1] {
                candies[i] = max(candies[i], 1 + candies[i + 1])
            }
        }
        
        return candies.reduce(0, +)
    }
    
    func testCandy() {
        XCTAssertEqual(candy([1, 0, 2]), 5)
        XCTAssertEqual(candy([1, 2, 2]), 4)
        XCTAssertEqual(candy([1, 3, 4, 5, 2]), 11)
    }

}
