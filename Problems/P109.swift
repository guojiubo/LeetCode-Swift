// Created on 2020/4/15

import XCTest
import List
import Tree

/*
 https://leetcode-cn.com/problems/convert-sorted-list-to-binary-search-tree/
 109. Convert Sorted List to Binary Search Tree
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted linked list: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5
 */

class P109: XCTestCase {
    
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

    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var nums: [Int] = []
        var head = head
        
        while head != nil {
            nums.append(head!.val)
            head = head!.next
        }
        
        return sortedArrayToBST(nums)
    }
    
    func testSortedListToBST() {
        let list = ListNode([-10, -3, 0, 5, 9])
        let tree = sortedListToBST(list)
        XCTAssertEqual(tree!.debugDescription, "[0,-10,5,null,-3,null,9]")
    }

}
