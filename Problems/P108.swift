// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/
 108. Convert Sorted Array to Binary Search Tree
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted array: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5
 */

class P108: XCTestCase {

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        func buildBST(_ start: Int, _ end: Int) -> TreeNode? {
            if start > end { return nil }
            
            let mid = start + (end - start) / 2
            let root = TreeNode(nums[mid])
            
            root.left = buildBST(start, mid - 1)
            root.right = buildBST(mid + 1, end)
            
            return root
        }
        
        return buildBST(0, nums.count - 1)
    }
    
    func testSortedArrayToBST() {
        let tree = sortedArrayToBST([-10, -3, 0, 5, 9])
        XCTAssertEqual(tree!.debugDescription, "[0,-10,5,null,-3,null,9]")
    }

}
