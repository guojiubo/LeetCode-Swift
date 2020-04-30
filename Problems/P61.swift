// Created on 2020/4/10

import XCTest
import List

/*
 https://leetcode-cn.com/problems/rotate-list/
 61. Rotate List
 Given a linked list, rotate the list to the right by k places, where k is non-negative.

 Example 1:

 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:

 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 */

class P61: XCTestCase {

    // 1  2  3  4  5
    //       ^     ^
    //      slow  fast
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var len = 0
        var curr = head
        while curr != nil {
            len += 1
            curr = curr?.next
        }
        
        let k = k % len
        if k == 0 {
            return head
        }
        
        var slow = head, fast = head
        for _ in 0..<k {
            fast = fast?.next
        }
        while fast != nil && fast!.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        let newHead = slow?.next
        slow?.next = nil
        fast?.next = head
        return newHead
    }
    
    func testRotateRight() {
        var head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(rotateRight(head, 2)!.debugDescription, "4 5 1 2 3")
        
        head = ListNode([0, 1, 2])
        XCTAssertEqual(rotateRight(head, 4)!.debugDescription, "2 0 1")
        
        head = ListNode([0, 1, 2])
        XCTAssertEqual(rotateRight(head, 3)!.debugDescription, "0 1 2")
        
        head = ListNode([1, 2])
        XCTAssertEqual(rotateRight(head, 3)!.debugDescription, "2 1")
    }

}
