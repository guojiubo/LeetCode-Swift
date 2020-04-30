// Created on 2020/4/26

import XCTest

/*
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/
 面试题33. 二叉搜索树的后序遍历序列
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

  

 参考以下这颗二叉搜索树：

      5
     / \
    2   6
   / \
  1   3
 示例 1：

 输入: [1,6,3,2,5]
 输出: false
 示例 2：

 输入: [1,3,2,6,5]
 输出: true
  

 提示：

 数组长度 <= 1000
 */

class LCOF33: XCTestCase {

    // BF solution
    // T: O(n^2)
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        for i in stride(from: postorder.count - 1, through: 0, by: -1) {
            let rootValue = postorder[i]
            var j = 0
            
            // left subtree nodes should less than root
            while j < i && postorder[j] < rootValue {
                j += 1
            }
            
            // right subtree nodes should greater than root
            // if not, it's not a valid binary tree postorder
            while j < i {
                if postorder[j] < rootValue {
                    return false
                } else {
                    j += 1
                }
            }
        }
        return true
    }
    
    // divide and conquer
    // T: O(n^2)
    func verifyPostorder(_ postorder: [Int], _ start: Int, _ end: Int) -> Bool {
        if start >= end { return true }
        
        let rootValue = postorder[end]
        
        var i = start
        while i < end && postorder[i] < rootValue {
            i += 1
        }
        
        var j = i
        while j < end {
            if postorder[j] < rootValue {
                return false
            } else {
                j += 1
            }
        }
        
        return verifyPostorder(postorder, start, i - 1) && verifyPostorder(postorder, i, end - 1)
    }
    
    func verifyPostorder2(_ postorder: [Int]) -> Bool {
        return verifyPostorder(postorder, 0, postorder.count - 1)
    }
    
    func testVerifyPostorder() {
        XCTAssertFalse(verifyPostorder([1,6,3,2,5]))
        XCTAssertTrue(verifyPostorder([1,3,2,6,5]))
    }
    
    func testVerifyPostorder2() {
        XCTAssertFalse(verifyPostorder2([1,6,3,2,5]))
        XCTAssertTrue(verifyPostorder2([1,3,2,6,5]))
    }

}
