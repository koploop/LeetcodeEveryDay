//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 暴力方法1: 时间复杂度: O(n2)
func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
    // 先从小到大排序
    for i in 0...nums.count {
        let inner = i + 1
        for j in inner...(nums.count - inner) {
            let num1 = nums[i]
            let num2 = nums[j]
            if num1 + num2 == target {
                return [i, j]
            }
        }
    }
    return []
}
print("two sum 1: \(twoSum([1,2,4,3,7], 6))")


// 思路: 时间复杂度: O(n)
// HashMap (dictionary和hashMap应该是同一个东西,叫法不一样而已, 都是用哈希表实现);
// 将数组中的元素作为key,index作为value存入map中,遍历数组this, 用目标值 - this = key, 如果这个key存在map中,则匹配到;
func twoSum_hashmap(_ nums:[Int], _ target:Int) -> [Int] {
    var map = [Int: Int]()
    for i in 0...nums.count {
        let num = target - nums[i]
        if let index = map[num] {
            return [i, index]
        }
        map.updateValue(i, forKey: nums[i])
    }
    return []
}
print("tow sum 2: \(twoSum_hashmap([1,2,4,3,7], 6))")


// 头尾双指针法
// 头尾各一个指针,相加之和如果大于目标值,则尾部指针向前移一位,如果小于目标值,则头部指针向后移一位;



