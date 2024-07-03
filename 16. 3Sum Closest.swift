//
//  Created by bbaatarg on 2024.07.01
//  Copyright © 2024 Bayarbaatar Gonchigsuren. All rights reserved.
//

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        var closest = 0
        var minDifference = Int.max
        
        for i in 0...nums.count - 2{
            
            var j = i + 1
            var k = nums.count - 1
            
            while (j < k){
                
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
                if sum == target{
                    return sum
                }
                if sum < target{
                    j += 1
                }
                else{
                    k -= 1
                }
                
                let diff = abs(sum - target)
                if diff < minDifference{
                    minDifference = diff
                    closest = sum
                }
            }
        }
               
        return closest
    }
}
