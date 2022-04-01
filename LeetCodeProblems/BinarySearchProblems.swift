//
// Created by Arsenii on 31.03.22.
//

import Foundation

/// 153. Find Minimum in Rotated Sorted Array
/// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
func findMin(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    if (nums.count == 1) || (nums.first! < nums.last!) {
        return nums.first!
    }
    var (l, r) = (0, nums.count-1)
    while l < r {
        if r - l == 1 { break }
        let m = l + (r - l) / 2
        if nums[l] < nums[m] {
            l = m
        } else {
            r = m
        }
    }
    return min(nums[l], nums[r])
}

/// TODO: 162. Find Peak Element
/// https://leetcode.com/problems/find-peak-element/
func findPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }

    var (l, r) = (0, nums.count-1)
    while l < r {
        let m = l + (r - l) / 2
        if m > 0 {
            r = m
        } else {
            l = m
        }
    }
    return 0
}
