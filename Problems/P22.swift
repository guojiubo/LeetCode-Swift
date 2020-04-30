// Created on 2020/4/8

import XCTest

/*
 22. Generate Parentheses
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]
 */

class P22: XCTestCase {

    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        
        func backtrack(_ path: String, _ left: Int, _ right: Int) {
            if left == 0 && right == 0 {
                result.append(path)
                return
            }
            if left > right{
                return
            }
            if left > 0 {
                backtrack(path + "(", left - 1, right)
            }
            if right > 0 {
                backtrack(path + ")", left, right - 1)
            }
        }
        
        backtrack("", n, n)
        
        return result
    }
    
    func testGenerateParenthesis() {
        XCTAssertEqual(generateParenthesis(3).count, 5)
    }

}
