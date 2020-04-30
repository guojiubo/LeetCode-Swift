// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/path-sum/
 112. Path Sum
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 */

class P112: XCTestCase {

    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.left == nil && root.right == nil && root.val == sum {
            return true
        }
        
        return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
    }
    
    func testHasPathSum() {
        let t = TreeNode([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
        XCTAssertTrue(hasPathSum(t, 22))
    }

}
