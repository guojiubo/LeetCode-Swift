// Created on 2020/5/15

import XCTest

/*
 https://leetcode-cn.com/problems/super-ugly-number/
 313. Super Ugly Number
 Write a program to find the nth super ugly number.

 Super ugly numbers are positive numbers whose all prime factors are in the given prime list primes of size k.

 Example:

 Input: n = 12, primes = [2,7,13,19]
 Output: 32
 Explanation: [1,2,4,7,8,13,14,16,19,26,28,32] is the sequence of the first 12
              super ugly numbers given primes = [2,7,13,19] of size 4.
 Note:

 1 is a super ugly number for any given primes.
 The given numbers in primes are in ascending order.
 0 < k ≤ 100, 0 < n ≤ 106, 0 < primes[i] < 1000.
 The nth super ugly number is guaranteed to fit in a 32-bit signed integer.
 */

class P313: XCTestCase {

    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var nums = Array(repeating: 1, count: n)
        var indexes = Array(repeating: 0, count: primes.count)
        
        for i in 1..<n {
            var num = Int.max
            
            for j in 0..<primes.count {
                num = min(num, nums[indexes[j]] * primes[j])
            }
            
            for j in 0..<primes.count {
                if num == nums[indexes[j]] * primes[j] {
                    indexes[j] += 1
                }
            }
            
            nums[i] = num
        }
        
        return nums[n - 1]
    }
    
    func testNthSuperUglyNumber() {
        XCTAssertEqual(nthSuperUglyNumber(12, [2,7,13,19]), 32)
    }

}
