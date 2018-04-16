//
//  LeetCode_002.swift
//  DebugProj
//
//  Created by SuperMario@lvhan on 2018/4/16.
//  Copyright © 2018年 Koploop. All rights reserved.
//

import Cocoa

/*
 * 大树相加问题(两个链表倒序相加输出新链表)
 */

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class LeetCode_002: NSObject {
    public static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var _l1 = l1, _l2 = l2
        var current = ListNode(0)
        let pCurrent = current
        var carry = 0
        while _l1 != nil || _l2 != nil || carry != 0 {
            let sum = (_l1 != nil ? _l1!.val : 0) + (_l2 != nil ? _l2!.val : 0) + carry
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            
            if let list1 = _l1 {
                _l1 = list1.next
            }
            if let list2 = _l2 {
                _l2 = list2.next
            }
        }
        return pCurrent.next
    }
    
    public static func printList(_ node: ListNode) {
        print(node.val)
        if let next = node.next {
            printList(next)
        }
    }
    
    public static func test() {
        let list1 = ListNode(2)
        list1.next = ListNode(4)
        list1.next?.next = ListNode(3)
        
        let list2 = ListNode(5)
        list2.next = ListNode(6)
        list2.next?.next = ListNode(4)
        
        let result = addTwoNumbers(list1, list2)
        printList(result!)
    }
}
