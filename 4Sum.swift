//
//  Created by bbaatarg on 2024.07.01
//  Copyright © 2024 Bayarbaatar Gonchigsuren. All rights reserved.
//

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }
        
        let nums = nums.sorted()
        let count = nums.count
        var result = [[Int]]()
        var a = 0
        
        if 4 * nums[0] > target || 4 * nums[count - 1] < target {
            return []
        }
        
        for i in 0..<count {
            a = nums[i]
            if i > 0 && a == nums[i - 1] {
                continue
            }
            if a + 3 * nums[count - 1] < target {
                continue
            }
            if 4 * a > target {
                break
            }
            if 4 * a == target {
                if i + 3 < count && nums[i + 3] == a {
                    result.append([a, a, a, a])
                }
                break
            }
            threeSum(nums, target - a, i + 1, count - 1, &result, a)
        }
        
        return result
    }
    
    private func threeSum(_ nums: [Int], _ target: Int, _ low: Int, _ high: Int, _ result: inout [[Int]], _ a: Int) {
        if low + 1 >= high {
            return
        }
        if 3 * nums[low] > target || 3 * nums[high] < target {
            return
        }
        
        var b = 0
        
        for i in low..<(high - 1) {
            b = nums[i]
            if i > low && b == nums[i - 1] {
                continue
            }
            if b + 2 * nums[high] < target {
                continue
            }
            if 3 * b > target {
                break
            }
            if 3 * b == target {
                if i + 1 < high && nums[i + 2] == b {
                    result.append([a, b, b, b])
                }
                break
            }
            
            twoSum(nums, target - b, i + 1, high, &result, a, b)
        }
    }
    
    private func twoSum(_ nums: [Int], _ target: Int, _ low: Int, _ high: Int, _ result: inout [[Int]], _ a: Int, _ b: Int) {
        if low >= high {
            return
        }
        if 2 * nums[low] > target || 2 * nums[high] < target {
            return
        }
        
        var i = low
        var j = high
        var sum = 0
        var x = 0
        
        while i < j {
            sum = nums[i] + nums[j]
            if sum == target {
                result.append([a, b, nums[i], nums[j]])
                x = nums[i]
                i += 1
                while i < j && x == nums[i] {
                    i += 1
                }
                x = nums[j]
                j -= 1
                while i < j && x == nums[j] {
                    j -= 1
                }
            }
            if sum < target {
                i += 1
            }
            if sum > target {
                j -= 1
            }
        }
    }
}
