// Created on 2020/4/13

import XCTest
import List

/*
 https://leetcode-cn.com/problems/partition-list/
 86. Partition List
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

 You should preserve the original relative order of the nodes in each of the two partitions.

 Example:

 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5
 */

class P86: XCTestCase {

    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let before = ListNode(0)
        var beforeTail = before
        let after = ListNode(0)
        var afterTail = after
        
        var head = head
        while head != nil {
            let next = head?.next
            if head!.val < x {
                head!.next = beforeTail.next
                beforeTail.next = head
                beforeTail = head!
            } else {
                head!.next = afterTail.next
                afterTail.next = head
                afterTail = head!
            }
            head = next
        }
        beforeTail.next = after.next
        return before.next
    }
    
    func testPartion() {
        let head = ListNode([1, 4, 3, 2, 5, 2])
        XCTAssertEqual(partition(head, 3)!.debugDescription, "1 2 2 4 3 5")
    }

}
