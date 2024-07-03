//
//  Created by bbaatarg on 2024.07.01
//  Copyright © 2024 Bayarbaatar Gonchigsuren. All rights reserved.
//

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        
        let dict = mapIntToLetter(start: 2, end: 9)
        var result : [String] = []
        
        for char in Array(digits){
            
            if let keys = dict[Int(String(char))!]{
                
                if result.isEmpty{
                    result = keys.map({ String($0) })
                }else{
                    var newResult : [String] = []
                    
                    for key in keys {
                        for exist in result {
                            newResult.append("\(exist)\(key)")
                        }
                    }
                    result = newResult
                }
            }
        }
        return result
    }
    
    func mapIntToLetter(start: Int, end: Int) -> Dictionary<Int, [Character]> {
        let lowerLetters = Array("abcdefghijklmnopqrstuvwxyz")
        var result = Dictionary<Int, [Character]>()
        var count = 0
        
        for num in start...end {
            let offset = num == 7 || num == 9 ? 4 : 3
            result[num] = Array(lowerLetters[count..<(count + offset)])
            count += offset
        }
        return result
    }
}
