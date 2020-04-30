//
//  TreeNode.swift
//  LeetCode-Swift
//
//  Created by guojiubo on 2020/2/22.
//  Copyright © 2020 guojiubo. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init?(_ vals: [Int?]) {
        var vals = vals
        guard !vals.isEmpty, let val = vals.removeFirst() else {
            return nil
        }
        self.val = val
        self.left = nil
        self.right = nil
        
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !vals.isEmpty, let val = vals.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !vals.isEmpty, let val = vals.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
    
    public static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }
        return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

extension TreeNode: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        var result: [String] = []
        var queue: [TreeNode?] = [self]
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                result.append("\(node.val)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append("null")
            }
        }
        while result.last == "null" {
            result.removeLast()
        }
        return "[\(result.joined(separator: ","))]"
    }
    
}
