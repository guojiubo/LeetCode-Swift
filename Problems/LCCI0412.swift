// Created on 2020/5/15

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/paths-with-sum-lcci/
 面试题 04.12. Paths with Sum LCCI
 You are given a binary tree in which each node contains an integer value (which might be positive or negative). Design an algorithm to count the number of paths that sum to a given value. The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).

 Example:
 Given the following tree and  sum = 22,

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 Output:

 3
 Explanation: Paths that have sum 22 are: [5,4,11,2], [5,8,4,5], [4,11,7]
 Note:

 node number <= 10000
 */

class LCCI0412: XCTestCase {

    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        var count = 0
        
        func dfs(_ root: TreeNode?, _ prefixSum: inout [Int: Int], _ pathSum: Int) {
            guard let root = root else { return }
            
            let pathSum = pathSum + root.val
            count += prefixSum[pathSum - sum] ?? 0
            
            prefixSum[pathSum, default: 0] += 1
            
            dfs(root.left, &prefixSum, pathSum)
            dfs(root.right, &prefixSum, pathSum)
            
            prefixSum[pathSum, default: 0] -= 1
        }
        
        var prefixSum = [0: 1]
        dfs(root, &prefixSum, 0)
        return count
    }
    
    func testPathSum() {
        let tree = TreeNode([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1])
        XCTAssertEqual(pathSum(tree, 22), 3)
    }

}
