// Created on 2020/4/24

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/validate-binary-search-tree/
 98. Validate Binary Search Tree
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:

     2
    / \
   1   3

 Input: [2,1,3]
 Output: true
 Example 2:

     5
    / \
   1   4
      / \
     3   6

 Input: [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
 */

class P98: XCTestCase {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        var pred: TreeNode? = nil
        var valid = true

        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }

            if !valid { return }

            inorder(root.left)

            if pred != nil && pred!.val >= root.val {
                valid = false
            }
            pred = root

            inorder(root.right)
        }

        inorder(root)
        return valid
    }
    
    func isValidBST2(_ root: TreeNode?) -> Bool {
        
        func dfs(_ root: TreeNode?, _ lower: TreeNode?, _ upper: TreeNode?) -> Bool {
            guard let root = root else {
                return true
            }
            if let lower = lower, root.val <= lower.val {
                return false
            }
            if let upper = upper, root.val >= upper.val {
                return false
            }
            return dfs(root.left, lower, root) && dfs(root.right, root, upper)
        }
        
        return dfs(root, nil, nil)
    }
    
    func testIsValidBST() {
        let t1 = TreeNode([2, 1, 3])
        XCTAssertTrue(isValidBST(t1))
        
        let t2 = TreeNode([5, 1, 4, nil, nil, 3, 6])
        XCTAssertFalse(isValidBST(t2))
        
        let t3 = TreeNode([1, 1])
        XCTAssertFalse(isValidBST(t3))
    }
    
    func testIsValidBST2() {
        let t1 = TreeNode([2, 1, 3])
        XCTAssertTrue(isValidBST2(t1))
        
        let t2 = TreeNode([5, 1, 4, nil, nil, 3, 6])
        XCTAssertFalse(isValidBST2(t2))
        
        let t3 = TreeNode([1, 1])
        XCTAssertFalse(isValidBST2(t3))
    }
    
}
