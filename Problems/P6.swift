// Created on 2020/4/7

import XCTest

/*
 6. ZigZag Conversion
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:

 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 */

class P6: XCTestCase {
    
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var array = Array(repeating: [Character](), count: numRows)
        var zigZag = false
        var i = 0
        for c in s {
            array[i].append(c)
            if i % (numRows - 1) == 0 { // numRows must > 1, else 'Division by zero in remainder operation' error happens
                zigZag = !zigZag
            }
            i = zigZag ? i + 1 : i - 1
        }
        return String(array.flatMap{ $0 })
    }
    
    func convert2(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var array = Array(repeating: [Character](), count: numRows)
        var plus = -1
        var i = 0
        for c in s {
            array[i].append(c)
            if i % (numRows - 1) == 0 {
                plus = -plus
            }
            i += plus
        }
        return String(array.flatMap{ $0 })
    }

    func testConvert() {
        XCTAssert(convert("PAYPALISHIRING", 0) == "PAYPALISHIRING")
        XCTAssert(convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
        XCTAssert(convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
    }
    
    func testConvert2() {
        XCTAssert(convert2("PAYPALISHIRING", 0) == "PAYPALISHIRING")
        XCTAssert(convert2("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
        XCTAssert(convert2("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
    }

}
