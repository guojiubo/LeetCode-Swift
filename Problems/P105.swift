// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 105. Construct Binary Tree from Preorder and Inorder Traversal
 Given preorder and inorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 */

class P105: XCTestCase {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderIndexMap: [Int: Int] = [:]
        for (idx, val) in inorder.enumerated() {
            inorderIndexMap[val] = idx
        }
        
        func buildTree(_ preorderStart: Int, _ preorderEnd: Int, _ inorderStart: Int, _ inorderEnd: Int) -> TreeNode? {
            if preorderStart > preorderEnd || inorderStart > inorderEnd { return nil }
            
            let rootVal = preorder[preorderStart]
            let rootIndex = inorderIndexMap[rootVal]!
            let leftNodes = rootIndex - inorderStart
            
            let root = TreeNode(rootVal)
            root.left = buildTree(preorderStart + 1, preorderStart + leftNodes, inorderStart, rootIndex - 1)
            root.right = buildTree(preorderStart + leftNodes + 1, preorderEnd, rootIndex + 1, inorderEnd)
            return root
        }
        return buildTree(0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    func testBuildTree() {
        let preorder = [3, 9, 20, 15, 7]
        let inorder = [9, 3, 15, 20, 7]
        let tree = buildTree(preorder, inorder)
        XCTAssertEqual(tree!.debugDescription, "[3,9,20,null,null,15,7]")
    }

}
