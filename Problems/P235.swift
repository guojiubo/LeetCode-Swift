// Created on 2020/4/22

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 235. Lowest Common Ancestor of a Binary Search Tree
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

 Given binary search tree:  root = [6,2,8,0,4,7,9,null,null,3,5]


  

 Example 1:

 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 Output: 6
 Explanation: The LCA of nodes 2 and 8 is 6.
 Example 2:

 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 Output: 2
 Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
  

 Note:

 All of the nodes' values will be unique.
 p and q are different and both values will exist in the BST.
 */

class P235: XCTestCase {

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        if root.val > p.val && root.val > q.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        if root.val < p.val && root.val < q.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        return root
    }
    
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var lca = root
        while lca != nil {
            if lca!.val > p!.val && lca!.val > q!.val {
                lca = lca!.left
            } else if lca!.val < p!.val && lca!.val < q!.val {
                lca = lca!.right
            } else {
                return lca
            }
        }
        return lca
    }
    
    func testLowerCommonAncestor() {
        let t1 = TreeNode([6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
        let p1 = TreeNode(2), q1 = TreeNode(8)
        XCTAssertEqual(lowestCommonAncestor(t1, p1, q1)!.val, 6)
        
        let t2 = TreeNode([6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
        let p2 = TreeNode(2), q2 = TreeNode(4)
        XCTAssertEqual(lowestCommonAncestor(t2, p2, q2)!.val, 2)
    }
    
    func testLowerCommonAncestor2() {
        let t1 = TreeNode([6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
        let p1 = TreeNode(2), q1 = TreeNode(8)
        XCTAssertEqual(lowestCommonAncestor2(t1, p1, q1)!.val, 6)
        
        let t2 = TreeNode([6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
        let p2 = TreeNode(2), q2 = TreeNode(4)
        XCTAssertEqual(lowestCommonAncestor2(t2, p2, q2)!.val, 2)
    }

}
