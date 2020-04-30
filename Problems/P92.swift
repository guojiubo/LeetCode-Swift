// Created on 2020/4/13

import XCTest
import List

/*
 https://leetcode-cn.com/problems/reverse-linked-list-ii/
 92. Reverse Linked List II
 Reverse a linked list from position m to n. Do it in one-pass.

 Note: 1 ≤ m ≤ n ≤ length of list.

 Example:

 Input: 1->2->3->4->5->NULL, m = 2, n = 4
 Output: 1->4->3->2->5->NULL
 */

class P92: XCTestCase {
    
    func reverseFirstNNodes(_ head: ListNode?, _ n: Int) -> ListNode? {
        var reversed: ListNode? = nil
        var curr = head
        for _ in 0..<n {
            let next = curr?.next
            curr?.next = reversed
            reversed = curr
            curr = next
        }
        head?.next = curr
        return reversed
    }

    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == 1 {
            return reverseFirstNNodes(head, n)
        }
        head?.next = reverseBetween(head?.next, m - 1, n - 1)
        return head
    }
    
    func testReverseBetween() {
        let head = ListNode([1, 2, 3, 4, 5])
        XCTAssertEqual(reverseBetween(head, 2, 4)!.debugDescription, "1 4 3 2 5")
    }

}
