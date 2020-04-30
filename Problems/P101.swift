// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/symmetric-tree/
 101. Symmetric Tree
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 But the following [1,2,2,null,3,null,3] is not:

     1
    / \
   2   2
    \   \
    3    3
  

 Follow up: Solve it both recursively and iteratively.
 */

class P101: XCTestCase {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil || q == nil {
                return p == nil && q == nil
            }
            return p?.val == q?.val && isMirror(p?.left, q?.right) && isMirror(p?.right, q?.left)
        }
        
        return isMirror(root.left, root.right)
    }
    
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        var stack = [root.left, root.right]
        while !stack.isEmpty {
            let t1 = stack.removeLast()
            let t2 = stack.removeLast()
            if t1 == nil && t2 == nil {
                continue
            }
            if t1 == nil || t2 == nil {
                return false
            }
            if t1?.val != t2?.val {
                return false
            }
            stack.append(t1?.left)
            stack.append(t2?.right)
            stack.append(t1?.right)
            stack.append(t2?.left)
        }
        return true
    }
    
    func testIsSymmetric() {
        var tree = TreeNode([1, 2, 2, 3, 4, 4, 3])
        XCTAssertTrue(isSymmetric(tree))
        
        tree = TreeNode([1, 2, 2, nil, 3, nil, 3])
        XCTAssertFalse(isSymmetric(tree))
    }
    
    func testIsSymmetric2() {
        var tree = TreeNode([1, 2, 2, 3, 4, 4, 3])
        XCTAssertTrue(isSymmetric2(tree))
        
        tree = TreeNode([1, 2, 2, nil, 3, nil, 3])
        XCTAssertFalse(isSymmetric2(tree))
    }

}
