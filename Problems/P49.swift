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

    // "abcccc" -> "#1#1#4#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0"
    func customHash(_ s: String) -> String {
        var bucket = Array(repeating: 0, count: 26)
        for c in s {
            let start = Character("a").asciiValue!
            let index = Int(c.asciiValue! - start)
            bucket[index] += 1
        }
        return bucket.reduce("", { "\($0)#\($1)" })
    }
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        for s in strs {
            let key = customHash(s)
            map[key, default: []].append(s)
        }
        return map.values.map{ $0 }
    }
    
    func test() {
        let result = groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
        print(result)
        XCTAssertEqual(result.count, 3)
    }

}
