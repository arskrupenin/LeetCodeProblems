//
// Created by Arsenii on 31.03.22.
//

import Foundation

/// 263. Ugly Number
/// https://leetcode.com/problems/ugly-number/
func isUgly(_ n: Int) -> Bool {
    if n <= 0 { return false }
    if n == 1 { return true }
    var temp = n
    while temp != 1 {
        if temp % 2 == 0 { temp = temp / 2 }
        else if temp % 3 == 0 { temp = temp / 3 }
        else if temp % 5 == 0 { temp = temp / 5 }
        else { return false }
    }
    return true
}