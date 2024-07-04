class Solution {
   func distributeCandies(_ n: Int, _ limit: Int) -> Int {
        var results : [[Int]] = []
        if n < 0{
            return 0
        }
        if n == 0{
            return 1
        }
        
        for i in 0...limit {
            
            let twoSum = n - i

            if twoSum <= limit * 2, twoSum >= 0{
                
                for a in 0...limit{
                    if twoSum - a >= 0 , limit >= a, limit >= twoSum - a{
                        results.append([i,a,twoSum - a])
                    }
                    
                }
                
            }
        }
        
        return results.count
    }
}
