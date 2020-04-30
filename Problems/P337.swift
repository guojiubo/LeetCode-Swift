// Created on 2020/4/21

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/house-robber-iii/
 337. House Robber III
 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Determine the maximum amount of money the thief can rob tonight without alerting the police.

 Example 1:

 Input: [3,2,3,null,3,null,1]

      3
     / \
    2   3
     \   \
      3   1

 Output: 7
 Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
 Example 2:

 Input: [3,4,5,1,3,null,1]

      3
     / \
    4   5
   / \   \
  1   3   1

 Output: 9
 Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
 */

class P337: XCTestCase {

    func rob(_ root: TreeNode?) -> Int {
        // rob: max amount if rob this house
        // skip: max amount if don't rob this house
        func dfs(_ root: TreeNode?) -> (rob: Int, skip: Int) {
            guard let root = root else {
                return (0, 0)
            }
            
            let left = dfs(root.left)
            let right = dfs(root.right)
            
            let rob = root.val + left.skip + right.skip
            let skip = max(left.rob, left.skip) + max(right.rob, right.skip)
            return (rob, skip)
        }
        
        let (rob, skip) = dfs(root)
        return max(rob, skip)
    }
    
    func testRob() {
        let t1 = TreeNode([3, 2, 3, nil, 3, nil, 1])
        XCTAssertEqual(rob(t1), 7)
        
        let t2 = TreeNode([3, 4, 5, 1, 3, nil, 1])
        XCTAssertEqual(rob(t2), 9)
    }
    
}
