// Created on 2020/4/16

import XCTest

/*
 https://leetcode-cn.com/problems/palindrome-partitioning/
 131. Palindrome Partitioning
 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return all possible palindrome partitioning of s.

 Example:

 Input: "aab"
 Output:
 [
   ["aa","b"],
   ["a","a","b"]
 ]
 */

class P131: XCTestCase {
    
    // dp[i][j] : indicates whether substring s[i...j] is a palindrome or not
    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        for j in 0..<s.count {
            for i in 0...j {
                if s[i] == s[j] && (j - i < 2 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                }
            }
        }
        
        var result: [[String]] = []
        
        func backtrack(_ path: [String], _ index: Int) {
            if index == s.count {
                result.append(path)
                return
            }
            
            for i in index..<s.count {
                if dp[index][i] == false {
                    continue
                }
                backtrack(path + [String(s[index...i])], i + 1)
            }
        }
        
        backtrack([], 0)
        return result
    }
    
    func testPartition() {
        XCTAssertEqual(partition("aab").count, 2)
    }

}
