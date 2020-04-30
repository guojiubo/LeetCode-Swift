// Created on 2020/4/8

import XCTest
import List

/*
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 21. Merge Two Sorted Lists
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

 Example:

 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 */

class P21: XCTestCase {

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var p = dummy
        var p1 = l1, p2 = l2
        while p1 != nil && p2 != nil {
            if p1!.val < p2!.val {
                p.next = p1!
                p1 = p1?.next
            } else {
                p.next = p2!
                p2 = p2?.next
            }
            p = p.next!
        }
        p.next = p1 ?? p2
        return dummy.next
    }
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let p1 = l1, let p2 = l2 else {
            return l1 ?? l2
        }
        if p1.val < p2.val {
            p1.next = mergeTwoLists(p1.next, p2)
            return p1
        } else {
            p2.next = mergeTwoLists(p1, p2.next)
            return p2
        }
    }
    
    func testMergeTwoLists() {
        var l1 = ListNode([1, 2, 4])
        var l2 = ListNode([1, 3, 4])
        XCTAssertEqual(mergeTwoLists(l1, l2)!.debugDescription, "1 1 2 3 4 4")
        
        l1 = ListNode([1, 2])
        l2 = ListNode([3, 4, 5])
        XCTAssertEqual(mergeTwoLists(l1, l2)!.debugDescription, "1 2 3 4 5")
    }
    
    func testMergeTwoLists2() {
        var l1 = ListNode([1, 2, 4])
        var l2 = ListNode([1, 3, 4])
        XCTAssertEqual(mergeTwoLists2(l1, l2)!.debugDescription, "1 1 2 3 4 4")
        
        l1 = ListNode([1, 2])
        l2 = ListNode([3, 4, 5])
        XCTAssertEqual(mergeTwoLists2(l1, l2)!.debugDescription, "1 2 3 4 5")
    }

}
