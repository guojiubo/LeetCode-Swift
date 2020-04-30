// Created on 2020/4/20

import XCTest

/*
 https://leetcode-cn.com/problems/reverse-bits/
 190. Reverse Bits
 Reverse bits of a given 32 bits unsigned integer.

  

 Example 1:

 Input: 00000010100101000001111010011100
 Output: 00111001011110000010100101000000
 Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
 Example 2:

 Input: 11111111111111111111111111111101
 Output: 10111111111111111111111111111111
 Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
  

 Note:

 Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
 In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above the input represents the signed integer -3 and the output represents the signed integer -1073741825.
  

 Follow up:

 If this function is called many times, how would you optimize it?
 */

class P190: XCTestCase {

    func reverseBits(_ n: Int) -> Int {
        var reversed = 0
        for i in 0..<32 where (n & 1 << i) != 0 {
            reversed |= 1 << (31 - i)
        }
        return reversed
    }
    
    // divide and conquer
    func reverseBits2(_ n: Int) -> Int {
        var n = n
        n = n >> 16 | n << 16
        n = (n & 0xff00ff00) >> 8 | (n & 0x00ff00ff) << 8
        n = (n & 0xf0f0f0f0) >> 4 | (n & 0x0f0f0f0f) << 4
        n = (n & 0xcccccccc) >> 2 | (n & 0x33333333) << 2
        n = (n & 0xaaaaaaaa) >> 1 | (n & 0x55555555) << 1
        return n
    }
    
    func testReverseBits() {
        XCTAssertEqual(reverseBits(43261596), 964176192)
        XCTAssertEqual(reverseBits(4294967293), 3221225471)
    }
    
    func testReverseBits2() {
        XCTAssertEqual(reverseBits2(43261596), 964176192)
        XCTAssertEqual(reverseBits2(4294967293), 3221225471)
    }

}
