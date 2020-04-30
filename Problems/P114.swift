// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/
 114. Flatten Binary Tree to Linked List
 Given a binary tree, flatten it to a linked list in-place.

 For example, given the following tree:

     1
    / \
   2   5
  / \   \
 3   4   6
 The flattened tree should look like:

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
 */

class P114: XCTestCase {

    // preorder
    func flatten(_ root: TreeNode?) {
        var prev: TreeNode? = nil
        var stack = [(false, root)]
        
        while !stack.isEmpty {
            let (visited, node) = stack.removeLast()
            if node == nil { continue }
            if visited {
                if prev != nil {
                    prev?.left = nil
                    prev?.right = node
                }
                prev = node
            } else {
                stack.append((false, node?.right))
                stack.append((false, node?.left))
                stack.append((true, node))
            }
        }
    }
    
    //         1
    //        / \
    //       2   5
    //      / \   \
    //     3   4   6,
    //
    //         1
    //        /
    //       2
    //      / \
    //     3   4
    //          \
    //           5
    //            \
    //             6,
    //
    //         1
    //          \
    //           2
    //          / \
    //         3   4
    //              \
    //               5
    //                \
    //                 6
    //      repeat
    func flatten2(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
                
        if root.left == nil {
            flatten2(root.right)
            return
        }
        
        var rightMostOfLeftSubTree = root.left
        while rightMostOfLeftSubTree?.right != nil {
            rightMostOfLeftSubTree = rightMostOfLeftSubTree?.right
        }

        rightMostOfLeftSubTree?.right = root.right
        root.right = root.left
        root.left = nil
        flatten2(root.right)
    }
    
    func flatten3(_ root: TreeNode?) {
        var curr = root
        while curr != nil {
            if curr!.left == nil {
                curr = curr?.right
                continue
            }
            
            var rightMostOfLeftSubTree = curr!.left
            while rightMostOfLeftSubTree?.right != nil {
                rightMostOfLeftSubTree = rightMostOfLeftSubTree?.right
            }

            rightMostOfLeftSubTree?.right = curr!.right
            curr!.right = curr!.left
            curr!.left = nil
            
            curr = curr?.right
        }
    }
    
    func testFlatten() {
        let t = TreeNode([1, 2, 5, 3, 4, nil, 6])
        flatten(t)
        XCTAssertEqual(t!.debugDescription, "[1,null,2,null,3,null,4,null,5,null,6]")
    }
    
    func testFlatten2() {
        let t = TreeNode([1, 2, 5, 3, 4, nil, 6])
        flatten2(t)
        XCTAssertEqual(t!.debugDescription, "[1,null,2,null,3,null,4,null,5,null,6]")
    }
    
    func testFlatten3() {
        let t = TreeNode([1, 2, 5, 3, 4, nil, 6])
        flatten2(t)
        XCTAssertEqual(t!.debugDescription, "[1,null,2,null,3,null,4,null,5,null,6]")
    }

}
