// Created on 2020/4/20

import XCTest
import Tree

/*
 https://leetcode-cn.com/problems/binary-search-tree-iterator/
 173. Binary Search Tree Iterator
 Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

 Calling next() will return the next smallest number in the BST.

  

 Example:



 BSTIterator iterator = new BSTIterator(root);
 iterator.next();    // return 3
 iterator.next();    // return 7
 iterator.hasNext(); // return true
 iterator.next();    // return 9
 iterator.hasNext(); // return true
 iterator.next();    // return 15
 iterator.hasNext(); // return true
 iterator.next();    // return 20
 iterator.hasNext(); // return false
  

 Note:

 next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
 You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.
 */

class P173: XCTestCase {
    
    class BSTIterator {
        
        var stack: [TreeNode] = []

        init(_ root: TreeNode?) {
            build(root)
        }
        
        func build(_ root: TreeNode?) {
            var curr = root
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
        }
        
        /** @return the next smallest number */
        func next() -> Int {
            let node = stack.removeLast()
            build(node.right)
            return node.val
        }
        
        /** @return whether we have a next smallest number */
        func hasNext() -> Bool {
            return !stack.isEmpty
        }
    }
    
    func testBSTIterator() {
        let tree = TreeNode([7, 3, 15, nil, nil, 9, 20])
        let iterator = BSTIterator(tree)
        XCTAssertEqual(iterator.next(), 3)
        XCTAssertEqual(iterator.next(), 7)
        XCTAssertTrue(iterator.hasNext())
        XCTAssertEqual(iterator.next(), 9)
        XCTAssertTrue(iterator.hasNext())
        XCTAssertEqual(iterator.next(), 15)
        XCTAssertTrue(iterator.hasNext())
        XCTAssertEqual(iterator.next(), 20)
        XCTAssertFalse(iterator.hasNext())
    }

}
