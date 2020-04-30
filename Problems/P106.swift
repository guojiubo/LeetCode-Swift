// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
 106. Construct Binary Tree from Inorder and Postorder Traversal
 Given inorder and postorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 */

class P106: XCTestCase {

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var inorderIndexMap: [Int: Int] = [:]
        for (idx, val) in inorder.enumerated() {
            inorderIndexMap[val] = idx
        }
        
        func buildTree(_ inorderStart: Int, _ inorderEnd: Int, _ postorderStart: Int, _ postorderEnd: Int) -> TreeNode? {
            if inorderStart > inorderEnd || postorderStart > postorderEnd {
                return nil
            }
            
            let rootVal = postorder[postorderEnd]
            let rootIndex = inorderIndexMap[rootVal]!
            let leftNodes = rootIndex - inorderStart
            
            let root = TreeNode(rootVal)
            root.left = buildTree(inorderStart, rootIndex - 1, postorderStart, postorderStart + leftNodes - 1)
            root.right = buildTree(rootIndex + 1, inorderEnd, postorderStart + leftNodes, postorderEnd - 1)
            return root
        }
        
        return buildTree(0, inorder.count - 1, 0, postorder.count - 1)
    }
    
    func testBuildTree() {
        let postorder = [9, 15, 7, 20, 3]
        let inorder = [9, 3, 15, 20, 7]
        let tree = buildTree(inorder, postorder)
        XCTAssertEqual(tree!.debugDescription, "[3,9,20,null,null,15,7]")
    }

}
