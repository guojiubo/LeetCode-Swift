// Created on 2020/4/7

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init?(_ vals: [Int]) {
        guard !vals.isEmpty else {
            return nil
        }
        self.val = vals[0]
        self.next = nil
        var tail: ListNode? = self
        for i in stride(from: 1, to: vals.count, by: 1) {
            tail?.next = ListNode(vals[i])
            tail = tail?.next
        }
    }
}

extension ListNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        var s = "\(val)"
        var p = self
        while p.next != nil {
            p = p.next!
            s = "\(s) \(p.val)"
        }
        return s
    }
}
