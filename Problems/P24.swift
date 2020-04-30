// Created on 2020/4/8

import XCTest
import List

/*
 https://leetcode-cn.com/problems/swap-nodes-in-pairs/
 24. Swap Nodes in Pairs
 Given a linked list, swap every two adjacent nodes and return its head.

 You may not modify the values in the list's nodes, only nodes itself may be changed.

  

 Example:

 Given 1->2->3->4, you should return the list as 2->1->4->3.
 */

class P24: XCTestCase {

    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next
    }
    
    func swapPairs2(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var curr = head
        while curr != nil {
            var i = 0
            while i < 2 && curr != nil {
                let next = curr?.next
                curr?.next = tail?.next
                tail?.next = curr
                curr = next
                i += 1
            }
            tail = tail?.next?.next
        }
        return dummy.next
    }
    
    func testSwapPairs() {
        var head = ListNode([1, 2, 3, 4])
        XCTAssertEqual(swapPairs(head)!.debugDescription, "2 1 4 3")
        head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(swapPairs(head)!.debugDescription, "2 1 4 3 5")
    }
    
    func testSwapPairs2() {
        var head = ListNode([1, 2, 3, 4])
        XCTAssertEqual(swapPairs2(head)!.debugDescription, "2 1 4 3")
        head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(swapPairs2(head)!.debugDescription, "2 1 4 3 5")
    }

}
