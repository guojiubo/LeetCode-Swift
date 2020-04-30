// Created on 2020/4/16

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/
 129. Sum Root to Leaf Numbers
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

 An example is the root-to-leaf path 1->2->3 which represents the number 123.

 Find the total sum of all root-to-leaf numbers.

 Note: A leaf is a node with no children.

 Example:

 Input: [1,2,3]
     1
    / \
   2   3
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 Example 2:

 Input: [4,9,0,5,1]
     4
    / \
   9   0
  / \
 5   1
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.
 */

class P129: XCTestCase {

    func sumNumbers(_ root: TreeNode?) -> Int {
        var total = 0

        func dfs(_ root: TreeNode?, _ sum: Int) {
            guard let root = root else {
                return
            }

            let sum = sum * 10 + root.val

            if root.left == nil && root.right == nil {
                total += sum
                return
            }

            dfs(root.left, sum)
            dfs(root.right, sum)
        }

        dfs(root, 0)

        return total
    }
    
    // https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/solution/0-ms-jiao-ke-shu-ji-jie-da-by-liuzhaoce/
    func sumNumbers(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        let sum = sum * 10 + root.val
        
        if root.left == nil && root.right == nil {
            return sum
        }
        
        return sumNumbers(root.left, sum) + sumNumbers(root.right, sum)
    }
    
    func sumNumbers2(_ root: TreeNode?) -> Int {
        return sumNumbers(root, 0)
    }
    
    func testSumNumbers() {
        let t1 = TreeNode([1, 2, 3])
        XCTAssertEqual(sumNumbers(t1), 25)
        
        let t2 = TreeNode([4, 9, 0, 5, 1])
        XCTAssertEqual(sumNumbers(t2), 1026)
    }
    
    func testSumNumbers2() {
        let t1 = TreeNode([1, 2, 3])
        XCTAssertEqual(sumNumbers2(t1), 25)
        
        let t2 = TreeNode([4, 9, 0, 5, 1])
        XCTAssertEqual(sumNumbers2(t2), 1026)
    }

}
