// Created on 2020/4/14

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/unique-binary-search-trees-ii/
 95. Unique Binary Search Trees II
 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.

 Example:

 Input: 3
 Output:
 [
   [1,null,3,2],
   [3,2,null,1],
   [3,1,null,null,2],
   [2,1,3],
   [1,null,2,null,3]
 ]
 Explanation:
 The above output corresponds to the 5 unique BST's shown below:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 */

class P95: XCTestCase {
    
    func generateTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }
        
        var trees: [TreeNode?] = []
        
        for i in start...end {
            let leftTrees = generateTrees(start, i - 1)
            let rightTrees = generateTrees(i + 1, end)
            
            for left in leftTrees {
                for right in rightTrees {
                    let root = TreeNode(i)
                    root.left = left
                    root.right = right
                    trees.append(root)
                }
            }
        }
        
        return trees
    }

    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [] }
        return generateTrees(1, n)
    }
    
    func testGenerateTrees() {
        for tree in generateTrees(3) {
            print(tree!.debugDescription)
        }
    }

}
