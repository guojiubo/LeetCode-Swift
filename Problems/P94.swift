// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
 94. Binary Tree Inorder Traversal
 Given a binary tree, return the inorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [1,3,2]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 */

class P94: XCTestCase {

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        func inorder(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            inorder(root.left)
            result.append(root.val)
            inorder(root.right)
        }
        
        inorder(root)
        return result
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var curr = root
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr!.left
            }
            curr = stack.removeLast()
            result.append(curr!.val)
            curr = curr!.right
        }
        return result
    }
    
    // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/yan-se-biao-ji-fa-yi-chong-tong-yong-qie-jian-ming/
    func inorderTraversal3(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack = [(false, root)]
        
        while !stack.isEmpty {
            let (visited, node) = stack.removeLast()
            if node == nil { continue }
            if visited {
                result.append(node!.val)
            } else {
                stack.append((false, node!.right))
                stack.append((true, node))
                stack.append((false, node!.left))
            }
        }
        
        return result
    }
    
    // Morris
    func inorderTraversal4(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        var current = root
        while current != nil {
            if current?.left == nil {
                result.append(current!.val)
                current = current?.right
            } else {
                var predecessor = current!.left
                while predecessor?.right != nil && predecessor?.right !== current {
                    predecessor = predecessor?.right
                }
                
                if predecessor?.right === current {
                    predecessor?.right = nil
                    result.append(current!.val)
                    current = current?.right
                } else {
                    predecessor?.right = current
                    current = current?.left
                }
            }
        }
        
        return result
    }
    
    func testInorderTraversal() {
        let tree = TreeNode([1, nil, 2, 3])
        XCTAssertEqual(inorderTraversal(tree).description, "[1, 3, 2]")
    }
    
    func testInorderTraversal2() {
        let tree = TreeNode([1, 2, 3])
        XCTAssertEqual(inorderTraversal2(tree).description, "[2, 1, 3]")
    }
    
    func testInorderTraversal3() {
        let tree = TreeNode([1, 2, 3])
        XCTAssertEqual(inorderTraversal3(tree).description, "[2, 1, 3]")
    }
    
    func testInorderTraversal4() {
        let tree = TreeNode([6, 4, 9, 2, 5, 7, 10, 1, 3, nil, nil, nil, 8])
        XCTAssertEqual(inorderTraversal4(tree).description, "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]")
    }

}
