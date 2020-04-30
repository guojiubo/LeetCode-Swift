// Created on 2020/4/22

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/recover-binary-search-tree/
 99. Recover Binary Search Tree
 Two elements of a binary search tree (BST) are swapped by mistake.

 Recover the tree without changing its structure.

 Example 1:

 Input: [1,3,null,null,2]

    1
   /
  3
   \
    2

 Output: [3,1,null,null,2]

    3
   /
  1
   \
    2
 Example 2:

 Input: [3,1,4,null,null,2]

   3
  / \
 1   4
    /
   2

 Output: [2,1,4,null,null,3]

   2
  / \
 1   4
    /
   3
 Follow up:

 A solution using O(n) space is pretty straight forward.
 Could you devise a constant space solution?
 */

class P99: XCTestCase {

    func recoverTree(_ root: TreeNode?) {
        var x: TreeNode? = nil, y: TreeNode? = nil
        var pred: TreeNode? = nil
        
        func inorder(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            inorder(root.left)
            if pred != nil && pred!.val > root.val {
                y = root
                if x == nil {
                    x = pred
                } else {
                    return
                }
            }
            pred = root
            inorder(root.right)
        }
        
        inorder(root)
        
        if let x = x, let y = y {
            let temp = x.val
            x.val = y.val
            y.val = temp
        }
    }
    
    func testRecoverTree() {
        let t1 = TreeNode([1, 3, nil, nil, 2])
        recoverTree(t1)
        XCTAssertEqual(t1!.debugDescription, "[3,1,null,null,2]")
        
        let t2 = TreeNode([3, 1, 4, nil, nil, 2])
        recoverTree(t2)
        XCTAssertEqual(t2!.debugDescription, "[2,1,4,null,null,3]")
    }

}
