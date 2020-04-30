// Created on 2020/4/7

import XCTest
import List

/*
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 19. Remove Nth Node From End of List
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?
 */

class P19: XCTestCase {

    // slow fast pointer
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slow = head, fast = head
        for _ in 0..<n {
            fast = fast?.next
        }
        
        if fast == nil {        // remove head
            return head?.next
        }
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return head
    }
    
    // use a dummy head
    func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy, fast = head
        
        for _ in 0..<n {
            fast = fast?.next
        }
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
    
    func testRemoveNthFromEnd() {
        var head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(removeNthFromEnd(head, 5)!.debugDescription, "2 3 4 5")
        
        head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(removeNthFromEnd(head, 2)!.debugDescription, "1 2 3 5")
    }
    
    func testRemoveNthFromEnd2() {
        var head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(removeNthFromEnd2(head, 5)!.debugDescription, "2 3 4 5")
        
        head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(removeNthFromEnd2(head, 2)!.debugDescription, "1 2 3 5")
    }

}
