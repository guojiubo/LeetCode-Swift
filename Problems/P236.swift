// Created on 2020/4/22

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 236. Lowest Common Ancestor of a Binary Tree
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

 Given the following binary tree:  root = [3,5,1,6,2,0,8,null,null,7,4]

 Example 1:

 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 
 Example 2:

 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
  

 Note:

 All of the nodes' values will be unique.
 p and q are different and both values will exist in the binary tree.
 */

class P236: XCTestCase {

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        if root.val == p.val || root.val == q.val {
            return root
        }
        
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        return left ?? right
    }
    
    func testLowerCommonAncestor() {
        let t1 = TreeNode([3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
        let p1 = TreeNode(5), q1 = TreeNode(1)
        XCTAssertEqual(lowestCommonAncestor(t1, p1, q1)!.val, 3)
        
        let t2 = TreeNode([3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
        let p2 = TreeNode(5), q2 = TreeNode(4)
        XCTAssertEqual(lowestCommonAncestor(t2, p2, q2)!.val, 5)
    }

}
