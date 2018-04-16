//
//  LeetCode_003.swift
//  DebugProj
//
//  Created by SuperMario@lvhan on 2018/4/16.
//  Copyright © 2018年 Koploop. All rights reserved.
//

import Cocoa

class LeetCode_003: NSObject {
    static func lengthOfLongestSubstring(_ s: String) -> (Int, String) {
        // 建立map表, 以字符为key, index为value, 不重复则放入map
        var map = [Character: Int]()
        var pStart = 0
        var length = 0
        var maxLength = length
        var subString = ""
        var i = 0
        
        for charac in s {
            if let index = map[charac], index >= pStart {
                // 存在,则从 index+1 处继续遍历
                pStart = index + 1
            }
            map.updateValue(i, forKey: charac)
            length = i - pStart + 1
            maxLength = max(maxLength, length)
            
            // 存储子串
            let startIndex = s.index(s.startIndex, offsetBy: pStart)
            let endIndex = s.index(s.startIndex, offsetBy: i)
            if endIndex.encodedOffset > startIndex.encodedOffset {
                subString = String(s[startIndex...endIndex])
            }
            i = i + 1
        }
        return (maxLength, subString)
    }
    
    static func test() {
        let string = "tmmzuxt"
        let length = lengthOfLongestSubstring(string)
        print(length)
    }
}
