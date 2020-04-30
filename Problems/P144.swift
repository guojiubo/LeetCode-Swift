// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 144. Binary Tree Preorder Traversal
 Given a binary tree, return the preorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [1,2,3]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 */

class P144: XCTestCase {

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        func preorder(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            result.append(root.val)
            preorder(root.left)
            preorder(root.right)
        }
        
        preorder(root)
        return result
    }
    
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var result: [Int] = []
        var stack = [root]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        
        return result
    }
    
    func preorderTraversal3(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack = [(false, root)]
        
        while !stack.isEmpty {
            let (visited, node) = stack.removeLast()
            if node == nil { continue }
            if visited {
                result.append(node!.val)
            } else {
                stack.append((false, node!.right))
                stack.append((false, node!.left))
                stack.append((true, node))
            }
        }
        
        return result
    }
    
    // Morris
    func preorderTraversal4(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        var curr = root
        while curr != nil {
            var pred = curr?.left
            if pred == nil {
                result.append(curr!.val)
                curr = curr?.right
            } else {
                while pred?.right != nil && pred?.right !== curr {
                    pred = pred?.right
                }
                if pred?.right === curr {
                    pred?.right = nil
                    curr = curr?.right
                } else {
                    result.append(curr!.val)
                    pred?.right = curr
                    curr = curr?.left
                }
            }
        }
        
        return result
    }
    
    func testPreorderTraversal() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(preorderTraversal(tree).description, "[1, 2, 4, 5, 3, 6, 7]")
    }
    
    func testPreorderTraversal2() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(preorderTraversal2(tree).description, "[1, 2, 4, 5, 3, 6, 7]")
    }
    
    func testPreorderTraversal3() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(preorderTraversal3(tree).description, "[1, 2, 4, 5, 3, 6, 7]")
    }
    
    func testPreorderTraversal4() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(preorderTraversal4(tree).description, "[1, 2, 4, 5, 3, 6, 7]")
    }

}
