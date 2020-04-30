// Created on 2020/4/15

import XCTest

/*
 https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node-ii/
 117. Populating Next Right Pointers in Each Node II
 Given a binary tree

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Follow up:

 You may only use constant extra space.
 Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.
  

 Example 1:



 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
  

 Constraints:

 The number of nodes in the given tree is less than 6000.
 -100 <= node.val <= 100
 */

class P117: XCTestCase {
    
    public class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
        public var next: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.next = nil
        }
    }

    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        if root.left == nil && root.right == nil {
            return root
        }
        
        if root.left != nil && root.right != nil {
            root.left?.next = root.right
        }
        
        var next = root.next
        while next != nil && next?.left == nil && next?.right == nil {
            next = next!.next
        }
        
        if root.right != nil {
            root.right?.next = next?.left ?? next?.right
        } else {
            root.left?.next = next?.left ?? next?.right
        }
        
        _ = connect(root.right)     // must connect right subtree first
        _ = connect(root.left)
        
        return root
    }

}
