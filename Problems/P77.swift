// Created on 2020/4/11

import XCTest

/*
 https://leetcode-cn.com/problems/combinations/
 77. Combinations
 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

 Example:

 Input: n = 4, k = 2
 Output:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 */

class P77: XCTestCase {

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var path: [Int] = []
        
        func backtrack(_ first: Int) {
            if path.count == k {
                result.append(path)
                return
            }
            if first > n {
                return
            }
            for i in first...n {
                path.append(i)
                backtrack(i + 1)
                path.removeLast()
            }
        }
        
        backtrack(1)
        return result
    }
    
    func testCombine() {
        XCTAssertEqual(combine(4, 2).description, "[[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]")
    }

}
