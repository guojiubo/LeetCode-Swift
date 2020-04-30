// Created on 2020/4/20

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-tree-right-side-view/
 199. Binary Tree Right Side View
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example:

 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---
 */

class P199: XCTestCase {

    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var result: [Int] = []
        var queue = [root]
        while !queue.isEmpty {
            result.append(queue.last!.val)
            
            let count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
    
    func testRightSideView() {
        let tree = TreeNode([1, 2, 3, nil, 5, nil, 4])
        print(rightSideView(tree))
    }

}
