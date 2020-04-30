// Created on 2020/4/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/path-sum-ii/
 113. Path Sum II
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

 Note: A leaf is a node with no children.

 Example:

 Given the below binary tree and sum = 22,

       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 Return:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]
 */

class P113: XCTestCase {

    // DFS + Backtracking
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var result: [[Int]] = []
        var path: [Int] = []
        
        func dfs(_ root: TreeNode?, _ sum: Int) {
            guard let root = root else {
                return
            }
            
            path.append(root.val)
            defer {
                path.removeLast()
            }
            
            if root.left == nil && root.right == nil && root.val == sum {
                result.append(path)
                return
            }
            
            dfs(root.left, sum - root.val)
            dfs(root.right, sum - root.val)
        }
        
        dfs(root, sum)
        return result
    }
    
    func testPathSum() {
        let t = TreeNode([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1])
        XCTAssertEqual(pathSum(t, 22).description, "[[5, 4, 11, 2], [5, 8, 4, 5]]")
    }

}
