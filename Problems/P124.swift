// Created on 2020/4/3

import XCTest

/*
 https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/
 124. Binary Tree Maximum Path Sum
 Given a non-empty binary tree, find the maximum path sum.

 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

 Example 1:

 Input: [1,2,3]

        1
       / \
      2   3

 Output: 6
 Example 2:

 Input: [-10,9,20,null,null,15,7]

    -10
    / \
   9  20
     /  \
    15   7

 Output: 42
 */

import Tree

class P124: XCTestCase {
    
    // https://leetcode-cn.com/problems/binary-tree-maximum-path-sum/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-30/
    func maxPathSum(_ root: TreeNode?) -> Int {        
        var maxSum = Int.min
        
        // return max path sum, which include root node
        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            
            let left = max(dfs(root.left), 0)
            let right = max(dfs(root.right), 0)

            // use global var to update max path if it's better to start a new path
            maxSum = max(maxSum, root.val + left + right)
            
            return root.val + max(left, right)
        }
    
        _ = dfs(root)
        
        return maxSum
    }
    
    func testMaxPathSum() {
        var tree = TreeNode([-10, 9, 20, nil, nil, 15, 7])
        XCTAssert(maxPathSum(tree) == 42)
        
        tree = TreeNode([-10, nil, 20, nil, 15, nil, -2, nil, -8, nil, 11])
        XCTAssert(maxPathSum(tree) == 36)
    }

}
