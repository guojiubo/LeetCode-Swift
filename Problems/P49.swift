// Created on 2020/4/9

import XCTest

/*
 https://leetcode-cn.com/problems/group-anagrams/
 49. Group Anagrams
 Given an array of strings, group anagrams together.

 Example:

 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 Note:

 All inputs will be in lowercase.
 The order of your output does not matter.
 */

class P49: XCTestCase {

    // "abcccc" -> [1,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] as key
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [[Int]: [String]] = [:]
        for s in strs {
            var key = Array(repeating: 0, count: 26)
            for c in s {
                key[Int(c.asciiValue! - 97)] += 1
            }
            map[key, default: []].append(s)
        }
        return Array(map.values)
    }
    
    func test() {
        let result = groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
        print(result)
        XCTAssertEqual(result.count, 3)
    }

}
