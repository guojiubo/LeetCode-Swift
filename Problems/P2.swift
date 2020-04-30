// Created on 2020/4/7

import XCTest

/*
 https://leetcode-cn.com/problems/add-two-numbers/
 2. Add Two Numbers
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example:

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

import List

class P2: XCTestCase {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var p = dummy
        var carry = 0
        var l1 = l1, l2 = l2
        while carry == 1 || l1 != nil || l2 != nil {
            var sum = carry
            if l1 != nil {
                sum += l1!.val
                l1 = l1!.next
            }
            if l2 != nil {
                sum += l2!.val
                l2 = l2!.next
            }
            p.next = ListNode(sum % 10)
            p = p.next!
            carry = sum / 10
        }
        return dummy.next
    }
    
    func testAddTwoNumbers() {
        let l1 = ListNode([2, 4, 3])
        let l2 = ListNode([5, 6, 6])
        XCTAssertEqual(addTwoNumbers(l1, l2)!.debugDescription, "7 0 0 1")
    }
}
