// Created on 2020/4/17

import XCTest

/*
 https://leetcode-cn.com/problems/copy-list-with-random-pointer/
 138. Copy List with Random Pointer
 A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

 Return a deep copy of the list.

 The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.
  

 Example 1:


 Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Example 2:


 Input: head = [[1,1],[2,1]]
 Output: [[1,1],[2,1]]
 Example 3:



 Input: head = [[3,null],[3,0],[3,null]]
 Output: [[3,null],[3,0],[3,null]]
 Example 4:

 Input: head = []
 Output: []
 Explanation: Given linked list is empty (null pointer), so return null.
  

 Constraints:

 -10000 <= Node.val <= 10000
 Node.random is null or pointing to a node in the linked list.
 Number of Nodes will not exceed 1000.
 */

class P138: XCTestCase {
    
    public class Node {
        public var val: Int
        public var next: Node?
        public var random: Node?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
            self.random = nil
        }
    }

    // 1->2->3
    // 1->1'->2->2'->3->3'
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else {
            return nil
        }
        
        // clone list witout random nodes
        // insert each clone node after the corresponding original node
        var original: Node? = head
        while original != nil {
            let clone = Node(original!.val)
            clone.next = original?.next
            original?.next = clone
            original = clone.next
        }
        
        // store clone list's head
        let copy = head.next
        
        // clone random nodes
        original = head
        while original != nil {
            let clone = original?.next
            clone?.random = original?.random?.next
            original = clone?.next
        }
        
        // separate original list and clone list
        original = head
        while original != nil {
            let clone = original?.next
            original?.next = clone?.next
            original = original?.next
            clone?.next = original?.next
        }
        
        return copy
    }
    
    func testCopyRandomList() {
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        
        node1.next = node2
        node2.next = node3
        
        node1.random = node3
        node3.random = node2
        
        var clone = copyRandomList(node1)
        var original: Node? = node1
        while original != nil {
            XCTAssert(original!.val == clone!.val  && original !== clone)
            if original?.random != nil {
                XCTAssert(original!.random?.val == clone!.random?.val && original?.random !== clone?.random)
            }
            original = original?.next
            clone = clone?.next
        }
    }

}
