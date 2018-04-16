//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 求字符串中无重复字符的最长子串

// 思路: 顺序遍历字符串,当遇到重复字符的时候,以(和它重复的字符)重复字符的index + 1 开始继续遍历.
// xabcdaeafg => pStart指针初始指向0, 发现a重复, 则从 pStart = b 处开始继续搜寻, 结果又发现了一个a,但这时候map中key=a的index < pStart,不影响,所以继续遍历.结果又发现一个a, 这时候就要从e开始遍历了.


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> (Int, String) {
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
    
    func test() {
        let string = "tmmzuxt"
        let length = lengthOfLongestSubstring(string)
        print(length)
    }
}


let solution = Solution()
solution.test()



