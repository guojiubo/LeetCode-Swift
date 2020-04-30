// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/
 103. Binary Tree Zigzag Level Order Traversal
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its zigzag level order traversal as:
 [
   [3],
   [20,9],
   [15,7]
 ]
 */

class P103: XCTestCase {

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        
        func dfs(_ root: TreeNode?, _ level: Int) {
            guard let root = root else {
                return
            }
            if result.count == level {
                result.append([])
            }
            result[level].append(root.val)
            dfs(root.left, level + 1)
            dfs(root.right, level + 1)
        }
        
        dfs(root, 0)
        
        for i in 0..<result.count {
            if i % 2 == 1 {
                result[i] = result[i].reversed()
            }
        }
    
        return result
    }
    
    func testZigzagLevelOrder() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(zigzagLevelOrder(tree).description, "[[1], [3, 2], [4, 5, 6, 7]]")
    }

}
