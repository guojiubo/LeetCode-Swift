// Created on 2020/4/8

import XCTest
import List

/*
 https://leetcode-cn.com/problems/merge-k-sorted-lists/
 23. Merge k Sorted Lists
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

 Example:

 Input:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 */

class P23: XCTestCase {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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

    // Up-Bottom, divide an conquer solution
    // T: O(NlogK) k: lists count, N: total nodes count
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        
        func divideAndConquer(_ low: Int, _ high: Int) -> ListNode? {
            if low == high {
                return lists[low]
            }
            let mid = low + (high - low) / 2
            let left = divideAndConquer(low, mid)
            let right = divideAndConquer(mid + 1, high)
            return mergeTwoLists(left, right)
        }
        
        return divideAndConquer(0, lists.count - 1)
    }
    
    // merge one by one
    // T: O(kN) k: lists count, N: total nodes count
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        var merged: ListNode? = nil
        for i in 0..<lists.count {
            merged = mergeTwoLists(merged, lists[i])
        }
        return merged
    }
    
    func testMergeKLists() {
        let lists = [ListNode([1, 4, 5]), ListNode([1, 3, 4]), ListNode([2, 6])]
        XCTAssertEqual(mergeKLists(lists)!.debugDescription, "1 1 2 3 4 4 5 6")
    }
    
    func testMergeKLists2() {
        let lists = [ListNode([1, 4, 5]), ListNode([1, 3, 4]), ListNode([2, 6])]
        XCTAssertEqual(mergeKLists2(lists)!.debugDescription, "1 1 2 3 4 4 5 6")
    }

}
