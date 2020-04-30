// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/
 107. Binary Tree Level Order Traversal II
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its bottom-up level order traversal as:
 [
   [15,7],
   [9,20],
   [3]
 ]
 */

class P107: XCTestCase {

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        
        func levelOrder(_ root: TreeNode?, _ level: Int) {
            guard let root = root else {
                return
            }
            if level == result.count {
                result.append([])
            }
            result[level].append(root.val)
            levelOrder(root.left, level + 1)
            levelOrder(root.right, level + 1)
        }
        
        levelOrder(root, 0)
        return result
    }

    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        return levelOrder(root).reversed()
    }
    
    func testLevelOrderBottom() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(levelOrderBottom(tree).description, "[[4, 5, 6, 7], [2, 3], [1]]")
    }

}
