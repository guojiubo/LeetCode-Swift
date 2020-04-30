// Created on 2020/4/14

import XCTest
import List

/*
 https://leetcode-cn.com/problems/add-two-numbers-ii/
 445. Add Two Numbers II
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:

 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
 */

class P445: XCTestCase {
        
    // use two stacks
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1: [Int] = [], stack2: [Int] = []
        var l1 = l1, l2 = l2
        while let node = l1 {
            stack1.append(node.val)
            l1 = l1?.next
        }
        while let node = l2 {
            stack2.append(node.val)
            l2 = l2?.next
        }
        
        var carry = 0
        var head: ListNode? = nil
        while carry == 1 || !stack1.isEmpty || !stack2.isEmpty {
            var sum = carry
            if !stack1.isEmpty {
                sum += stack1.removeLast()
            }
            if !stack2.isEmpty {
                sum += stack2.removeLast()
            }
            
            let node = ListNode(sum % 10)
            node.next = head
            head = node
            
            carry = sum / 10
        }
        return head
    }
    
    // recursive solution
    // first prepend zero nodes to make two list's length equal to each other
    func recursiveAddTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> (ListNode?, Int) {
        guard let l1 = l1, let l2 = l2 else {
            return (nil, 0)
        }
        
        let (next, carry) = recursiveAddTwoNumbers(l1.next, l2.next)
        
        let sum = l1.val + l2.val + carry
        let node = ListNode(sum % 10)
        node.next = next
        return (node, sum / 10)
    }
    
    func getListLength(_ head: ListNode?) -> Int {
        var len = 0
        var head = head
        while head != nil {
            len += 1
            head = head!.next
        }
        return len
    }
    
    func prependZeroes(_ head: ListNode?, _ n: Int) -> ListNode? {
        var head = head
        for _ in 0..<n {
            let zero = ListNode(0)
            zero.next = head
            head = zero
        }
        return head
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let len1 = getListLength(l1), len2 = getListLength(l2)

        var l1 = l1, l2 = l2
        if len1 < len2 {
            l1 = prependZeroes(l1, len2 - len1)
        } else {
            l2 = prependZeroes(l2, len1 - len2)
        }
        
        let (head, carry) = recursiveAddTwoNumbers(l1, l2)
        if carry == 0 {
            return head
        }
        let node = ListNode(1)
        node.next = head
        return node
    }
    
    func testAddTwoNumbers() {
        let l1 = ListNode([7, 2, 4, 3])
        let l2 = ListNode([5, 6, 4])
        let sum = addTwoNumbers(l1, l2)
        XCTAssertEqual(sum!.debugDescription, "7 8 0 7")
    }
    
    func testAddTwoNumbers2() {
        let l1 = ListNode([7, 2, 4, 3])
        let l2 = ListNode([5, 6, 4])
        let sum = addTwoNumbers2(l1, l2)
        XCTAssertEqual(sum!.debugDescription, "7 8 0 7")
    }


}
