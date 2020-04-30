// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/balanced-binary-tree/
 110. Balanced Binary Tree
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:

 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

  

 Example 1:

 Given the following tree [3,9,20,null,null,15,7]:

     3
    / \
   9  20
     /  \
    15   7
 Return true.

 Example 2:

 Given the following tree [1,2,2,3,3,null,null,4,4]:

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 Return false.
 */

class P110: XCTestCase {

    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
    
    // T: O(nlogn)
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return abs(maxDepth(root.left) - maxDepth(root.right)) <= 1 &&
            isBalanced(root.left) &&
            isBalanced(root.right)
    }
    
    // T: O(n)
    func isBalanced2(_ root: TreeNode?) -> Bool {
        
        func dfs(_ root: TreeNode?) -> (maxDepth: Int, isBalanced: Bool) {
            guard let root = root else {
                return (0, true)
            }
            
            let (leftMaxDepth, isLeftBlanced) = dfs(root.left)
            if !isLeftBlanced {
                return (0, false)
            }
            
            let (rightMaxDepth, isRightBalanced) = dfs(root.right)
            if !isRightBalanced {
                return (0, false)
            }
            
            if abs(leftMaxDepth - rightMaxDepth) > 1 {
                return (0, false)
            }
            
            return (1 + max(leftMaxDepth, rightMaxDepth), true)
        }
        
        return dfs(root).isBalanced
    }
    
    func testIsBalanced() {
        let t1 = TreeNode([3, 9, 20, nil, nil, 15, 7])
        XCTAssertTrue(isBalanced(t1))
        
        let t2 = TreeNode([1, 2, 2, 3, 3, nil, nil, 4, 4])
        XCTAssertFalse(isBalanced(t2))
    }
    
    func testIsBalanced2() {
        let t1 = TreeNode([3, 9, 20, nil, nil, 15, 7])
        XCTAssertTrue(isBalanced2(t1))
        
        let t2 = TreeNode([1, 2, 2, 3, 3, nil, nil, 4, 4])
        XCTAssertFalse(isBalanced2(t2))
    }

}
