// Created on 2020/4/12

import XCTest
import List

/*
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
 82. Remove Duplicates from Sorted List II
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.

 Return the linked list sorted as well.

 Example 1:

 Input: 1->2->3->3->4->4->5
 Output: 1->2->5
 Example 2:

 Input: 1->1->1->2->3
 Output: 2->3
 */

class P82: XCTestCase {

    // 1   1   1   2   3
    // p           c        // count = 3, duplicated, do nothing
    //             p   c    // count = 1, no duplicate, insert 2 to tail
    //                 p  c // count = 1, insert 3 to tail
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        
        var curr = head
        while curr != nil {
            let prev = curr
            var count = 0
            while curr?.val == prev?.val {
                count += 1
                curr = curr?.next
            }
            if count == 1 {
                prev?.next = tail.next
                tail.next = prev
                tail = prev!
            }
        }
        return dummy.next
    }
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        if head!.val != head!.next!.val {
            head?.next = deleteDuplicates2(head?.next)
            return head
        }
        var head = head
        while head!.next != nil && head!.val == head!.next!.val {
            head = head!.next
        }
        return deleteDuplicates2(head!.next)
    }
    
    func testDeleteDuplicates() {
        var head = ListNode([1,2,3,3,4,4,5])
        head = deleteDuplicates(head)
        XCTAssertEqual(head!.debugDescription, "1 2 5")
        
        head = ListNode([1,1,1,2,3])
        head = deleteDuplicates(head)
        XCTAssertEqual(head!.debugDescription, "2 3")
        
        head = ListNode([1,1,1])
        head = deleteDuplicates(head)
        XCTAssertNil(head)
    }
    
    func testDeleteDuplicates2() {
        var head = ListNode([1,2,3,3,4,4,5])
        head = deleteDuplicates2(head)
        XCTAssertEqual(head!.debugDescription, "1 2 5")
        
        head = ListNode([1,1,1,2,3])
        head = deleteDuplicates2(head)
        XCTAssertEqual(head!.debugDescription, "2 3")
        
        head = ListNode([1,1,1])
        head = deleteDuplicates2(head)
        XCTAssertNil(head)
    }

}
