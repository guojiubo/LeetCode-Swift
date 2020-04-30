// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/
 17. Letter Combinations of a Phone Number
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.



 Example:

 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:

 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

class P17: XCTestCase {

    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        
        let map: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"],
        ]
        
        let digits = Array(digits)
        var result: [String] = []
        
        func backtrack(_ path: String, _ i: Int) {
            if i == digits.count {
                result.append(path)
                return
            }
            let list = map[digits[i]]!
            for s in list {
                backtrack(path + s, i + 1)
            }
        }
        
        backtrack("", 0)
        return result
    }
    
    func testLetterCombination() {
        XCTAssert(letterCombinations("23").count == 9)
    }

}
