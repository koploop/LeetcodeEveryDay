//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 两数相加问题
 */

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
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
            print(current.val)
        }
        return pCurrent.next
    }
    
    public static func test() {
        let list1 = ListNode(2)
        list1.next = ListNode(4)
        list1.next?.next = ListNode(3)
        
        let list2 = ListNode(5)
        list2.next = ListNode(6)
        list2.next?.next = ListNode(4)
        
        _ = addTwoNumbers(list1, list2)
    }
}

Solution.test()
