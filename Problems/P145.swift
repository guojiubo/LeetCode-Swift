// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
 145. Binary Tree Postorder Traversal
 Given a binary tree, return the postorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [3,2,1]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 */

class P145: XCTestCase {
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        func postorder(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            postorder(root.left)
            postorder(root.right)
            result.append(root.val)
        }
        
        postorder(root)
        return result
    }
    
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var result: [Int] = []
        var stack = [root]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        
        return result.reversed()
    }

    func postorderTraversal3(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack = [(false, root)]
        
        while !stack.isEmpty {
            let (visited, node) = stack.removeLast()
            if node == nil { continue }
            if visited {
                result.append(node!.val)
            } else {
                stack.append((true, node))
                stack.append((false, node!.right))
                stack.append((false, node!.left))
            }
        }
        
        return result
    }
    
    func testPostorderTraversal() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(postorderTraversal(tree).description, "[4, 5, 2, 6, 7, 3, 1]")
    }
    
    func testPostorderTraversal2() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(postorderTraversal2(tree).description, "[4, 5, 2, 6, 7, 3, 1]")
    }
    
    func testPostorderTraversal3() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(postorderTraversal3(tree).description, "[4, 5, 2, 6, 7, 3, 1]")
    }

}
