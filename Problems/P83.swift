// Created on 2020/4/12

import XCTest
import List

/*
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 83. Remove Duplicates from Sorted List
 Given a sorted linked list, delete all duplicates such that each element appear only once.

 Example 1:

 Input: 1->1->2
 Output: 1->2
 Example 2:

 Input: 1->1->2->3->3
 Output: 1->2->3
 */

class P83: XCTestCase {

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        if head!.val == head!.next!.val {
            return deleteDuplicates(head?.next)
        }
        head?.next = deleteDuplicates(head?.next)
        return head
    }
    
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        var prev = head
        var curr = head?.next
        while curr != nil {
            while curr?.val == prev?.val {
                curr = curr?.next
            }
            prev?.next = curr
            prev = curr
            curr = curr?.next
        }
        return head
    }

    // https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/solution/shan-chu-pai-xu-lian-biao-zhong-de-zhong-fu-yuan-s/
    func deleteDuplicates3(_ head: ListNode?) -> ListNode? {
        var curr = head
        while curr != nil && curr!.next != nil {
            if curr!.val == curr!.next!.val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return head
    }
    
    func testDeleteDuplicates() {
        var head = ListNode([1,2,3,3,4,4,5])
        head = deleteDuplicates(head)
        XCTAssertEqual(head!.debugDescription, "1 2 3 4 5")
        
        head = ListNode([1,1,1,2,3])
        head = deleteDuplicates(head)
        XCTAssertEqual(head!.debugDescription, "1 2 3")
        
        head = ListNode([1,1,1])
        head = deleteDuplicates(head)
        XCTAssertEqual(head!.debugDescription, "1")
    }
    
    func testDeleteDuplicates2() {
        var head = ListNode([1,2,3,3,4,4,5])
        head = deleteDuplicates2(head)
        XCTAssertEqual(head!.debugDescription, "1 2 3 4 5")
        
        head = ListNode([1,1,1,2,3])
        head = deleteDuplicates2(head)
        XCTAssertEqual(head!.debugDescription, "1 2 3")
        
        head = ListNode([1,1,1])
        head = deleteDuplicates2(head)
        XCTAssertEqual(head!.debugDescription, "1")
    }

}
