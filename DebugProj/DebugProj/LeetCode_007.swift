//
//  LeetCode_007.swift
//  DebugProj
//
//  Created by SuperMario@lvhan on 2018/4/16.
//  Copyright © 2018年 Koploop. All rights reserved.
//

import Cocoa

/*
 * 给定一个 32 位有符号整数，将整数中的数字进行反转。
 * 输入: 120 输出: 21
 * 输入: -123  输出: -321
 * 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。根据这个假设，如果反转后的整数溢出，则返回 0。
 */

class LeetCode_007: NSObject {
    
    static func reverse(_ x: Int) -> Int {
        var result = ""
        var symbolCharac: Character?
        // 转为字符串
        let string = "\(x)"
        // 入栈
        var stack = [Character]()
        for charac in string {
            guard let _ = Int(String.init(charac)) else {
                symbolCharac = charac
                continue
            }
            stack.append(charac)
        }
        // 出栈
        for _ in stack {
            let charc = stack.removeLast()
            if Int(String.init(charc)) == 0, result.count <= 0 {
                continue
            }
            result.append(charc)
        }
        if let symbolCharac = symbolCharac {
            result.insert(symbolCharac, at: result.startIndex)
        }
        if let _ = Int32(result) { // 需要考虑溢出的情况下,也返回0
            return Int(result)!
        }
        return 0
    }
    
    static public func test() {
        print(self.reverse(1534236469))
    }
}
