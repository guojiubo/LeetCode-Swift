// Created on 2020/4/26

import XCTest

/*
 https://leetcode-cn.com/problems/implement-queue-using-stacks/
 232. Implement Queue using Stacks
 Implement the following operations of a queue using stacks.

 push(x) -- Push element x to the back of queue.
 pop() -- Removes the element from in front of queue.
 peek() -- Get the front element.
 empty() -- Return whether the queue is empty.
 Example:

 MyQueue queue = new MyQueue();

 queue.push(1);
 queue.push(2);
 queue.peek();  // returns 1
 queue.pop();   // returns 1
 queue.empty(); // returns false
 Notes:

 You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
 Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
 You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).
 */

class P232: XCTestCase {

    class MyQueue {
        private var inStack: [Int] = []
        private var outStack: [Int] = []
        
        init() {}
        
        /** Push element x to the back of queue. */
        func push(_ x: Int) {
            inStack.append(x)
        }
        
        /** Removes the element from in front of queue and returns that element. */
        func pop() -> Int {
            if outStack.isEmpty {
                while !inStack.isEmpty {
                    outStack.append(inStack.removeLast())
                }
            }
            return outStack.removeLast()
        }
        
        /** Get the front element. */
        func peek() -> Int {
            if outStack.isEmpty {
                while !inStack.isEmpty {
                    outStack.append(inStack.removeLast())
                }
            }
            return outStack.last!
        }
        
        /** Returns whether the queue is empty. */
        func empty() -> Bool {
            return inStack.isEmpty && outStack.isEmpty
        }
    }
    
    func testMyQueue() {
        let queue = MyQueue()
        queue.push(1)
        queue.push(2)
        queue.push(3)
        XCTAssertEqual(queue.peek(), 1)
        XCTAssertEqual(queue.pop(), 1)
        XCTAssertEqual(queue.peek(), 2)
        XCTAssertFalse(queue.empty())
    }

}
