// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
 111. Minimum Depth of Binary Tree
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its minimum depth = 2.
 */

class P111: XCTestCase {

    //        1
    //       /
    //      2
    // minDepth should be 2
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.left == nil {
            return 1 + minDepth(root.right)
        }
        if root.right == nil {
            return 1 + minDepth(root.left)
        }
        return 1 + min(minDepth(root.left), minDepth(root.right))
    }
    
    func testMinDepth() {
        let t1 = TreeNode([3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(minDepth(t1), 2)
        
        let t2 = TreeNode([1, 2])
        XCTAssertEqual(minDepth(t2), 2)
    }

}
