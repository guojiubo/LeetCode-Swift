// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/same-tree/
 100. Same Tree
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

 Example 1:

 Input:     1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 Output: true
 Example 2:

 Input:     1         1
           /           \
          2             2

         [1,2],     [1,null,2]

 Output: false
 Example 3:

 Input:     1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 Output: false
 */

class P100: XCTestCase {

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }
        return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    func testIsSameTree() {
        var p = TreeNode([1, 2, 3])
        var q = TreeNode([1, 2, 3])
        XCTAssertTrue(isSameTree(p, q))
        
        p = TreeNode([1, 2, 1])
        q = TreeNode([1, 1, 2])
        XCTAssertFalse(isSameTree(p, q))
    }

}
