// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 102. Binary Tree Level Order Traversal
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:
 [
   [3],
   [9,20],
   [15,7]
 ]
 */

class P102: XCTestCase {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        
        func levelOrder(_ root: TreeNode?, _ level: Int) {
            guard let root = root else {
                return
            }
            if level == result.count {
                result.append([])
            }
            result[level].append(root.val)
            levelOrder(root.left, level + 1)
            levelOrder(root.right, level + 1)
        }
        
        levelOrder(root, 0)
        return result
    }

    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result: [[Int]] = []
        var queue = [root]
        
        while !queue.isEmpty {
            var vals: [Int] = []
            let count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                vals.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(vals)
        }
        
        return result
    }
    
    func levelOrder3(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        var stack = [(false, root, 0)]
        
        while !stack.isEmpty {
            let (visited, node, level) = stack.removeLast()
            if node == nil { continue }
            if visited {
                if result.count == level {
                    result.append([])
                }
                result[level].append(node!.val)
            } else {
                stack.append((false, node!.right, level + 1))
                stack.append((false, node!.left, level + 1))
                stack.append((true, node, level))
            }
        }
        
        return result
    }
    
    func testLevelOrder() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(levelOrder(tree).description, "[[1], [2, 3], [4, 5, 6, 7]]")
    }
    
    func testLevelOrder2() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(levelOrder2(tree).description, "[[1], [2, 3], [4, 5, 6, 7]]")
    }
    
    func testLevelOrder3() {
        let tree = TreeNode([1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(levelOrder3(tree).description, "[[1], [2, 3], [4, 5, 6, 7]]")
    }

}
