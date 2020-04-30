// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
 104. Maximum Depth of Binary Tree
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
 */

class P104: XCTestCase {

    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
    
    func testMaxDepth() {
        let tree = TreeNode([3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(maxDepth(tree), 3)
    }

}
