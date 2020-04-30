// Created on 2020/4/22

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/
 297. Serialize and Deserialize Binary Tree
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Example:

 You may serialize the following tree:

     1
    / \
   2   3
      / \
     4   5

 as "[1,2,3,null,null,4,5]"
 Clarification: The above format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

 Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
 */

class P297: XCTestCase {

    class Codec {
        
        func serialize(_ root: TreeNode?) -> String {
            var nodes: [String] = []
            var queue = [root]
            while !queue.isEmpty {
                if let node = queue.removeFirst() {
                    nodes.append(String(node.val))
                    queue.append(node.left)
                    queue.append(node.right)
                } else {
                    nodes.append("#")
                }
            }
            return nodes.joined(separator: ",")
        }
        
        func deserialize(_ data: String) -> TreeNode? {
            let nodes = data.split(separator: ",").map{ $0 == "#" ? nil : TreeNode(Int($0)!) }
            
            if nodes.isEmpty { return nil }
            
            let root = nodes[0]
            var i = 0, j = 1
            while j < nodes.count {
                if let node = nodes[i] {
                    node.left = nodes[j]
                    j += 1
                    node.right = nodes[j]
                    j += 1
                }
                i += 1
            }
            return root
        }
    }
    
    func testCodec() {
        let string = "1,2,3,#,#,4,5,#,#,#,#"
        let codec = Codec()
        let tree = codec.deserialize(string)
        XCTAssertEqual(codec.serialize(tree), string)
    }

}
