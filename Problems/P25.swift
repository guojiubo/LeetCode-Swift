// Created on 2020/4/8

import XCTest
import List

/*
 https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
 25. Reverse Nodes in k-Group
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

 Example:

 Given this linked list: 1->2->3->4->5

 For k = 2, you should return: 2->1->4->3->5

 For k = 3, you should return: 3->2->1->4->5

 Note:

 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
 */

class P25: XCTestCase {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var reversed: ListNode? = nil
        var curr = head
        var i = 0
        while i < k && curr != nil {
            let next = curr?.next
            curr?.next = reversed
            reversed = curr
            curr = next
            i += 1
        }
        
        if i != k {
            curr = reversed
            reversed = nil
            while curr != nil {
                let next = curr?.next
                curr?.next = reversed
                reversed = curr
                curr = next
            }
        } else {
            head?.next = reverseKGroup(curr, k)
        }
        return reversed
    }
    
    func reverseKGroup2(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var curr = head
        var i = 0
        while i < k && curr != nil {
            curr = curr?.next
            i += 1
        }
        
        if i < k {
            return head
        }
        
        let nextGroup = reverseKGroup2(curr, k)
        
        curr = head
        var reversed: ListNode? = nil
        while curr != nil && i > 0 {
            let next = curr?.next
            curr?.next = reversed
            reversed = curr
            curr = next
            i -= 1
        }
        head?.next = nextGroup
        return reversed
    }
    
    func testReverseKGroup() {
        XCTAssertEqual(reverseKGroup(ListNode([1, 2, 3, 4, 5]), 1)!.debugDescription, "1 2 3 4 5")
        XCTAssertEqual(reverseKGroup(ListNode([1, 2, 3, 4, 5]), 2)!.debugDescription, "2 1 4 3 5")
        XCTAssertEqual(reverseKGroup(ListNode([1, 2, 3, 4, 5]), 3)!.debugDescription, "3 2 1 4 5")
        XCTAssertEqual(reverseKGroup(ListNode([1, 2, 3, 4, 5]), 4)!.debugDescription, "4 3 2 1 5")
    }
    
    func testReverseKGroup2() {
        XCTAssertEqual(reverseKGroup2(ListNode([1, 2, 3, 4, 5]), 1)!.debugDescription, "1 2 3 4 5")
        XCTAssertEqual(reverseKGroup2(ListNode([1, 2, 3, 4, 5]), 2)!.debugDescription, "2 1 4 3 5")
        XCTAssertEqual(reverseKGroup2(ListNode([1, 2, 3, 4, 5]), 3)!.debugDescription, "3 2 1 4 5")
        XCTAssertEqual(reverseKGroup2(ListNode([1, 2, 3, 4, 5]), 4)!.debugDescription, "4 3 2 1 5")
    }

}
