//
// Created by Arsenii on 31.03.22.
//

import Foundation

/// 33. Search in Rotated Sorted Array
/// https://leetcode.com/problems/search-in-rotated-sorted-array/
func search(_ nums: [Int], _ target: Int) -> Int {
	var (l, r) = (0, nums.count - 1)
	while (l <= r) {
		let m = (r - l) / 2 + l
		if (nums[m] == target) { return m }
		if (nums[m] < nums[r]) {
			if nums[m] < target, target <= nums[r] {
				l = m + 1
			} else {
				r = m - 1
			}
		} else if nums[l] <= target, target < nums[m] {
				r = m - 1
		} else {
				l = m + 1
		}
	}
	return -1
}

/// 34. Find First and Last Position of Element in Sorted Array
/// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
	if nums.isEmpty { return [-1,-1] }
	var (l, r) = (0, nums.count - 1)
	while l <= r {
		if nums[l] == target, nums[r] == target { return [l, r] }
		let m = l + (r - l) / 2
		if nums[m] > target {
			r = m - 1
		} else if nums[m] < target {
			l = m + 1
		} else {
			if nums[l] < target { l = l + 1 }
			if nums[r] > target { r = r - 1 }
		}
	}
	return [-1, -1]
}

/// 35. Search Insert Position
/// https://leetcode.com/problems/search-insert-position/
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
	var (l, r) = (0, nums.count - 1)
	while l < r {
		let m = l + (r - l) / 2
		if nums[m] == target {
			return m
		} else if nums[m] > target {
			r = m - 1
		} else {
			l = m + 1
		}
	}
	return l
}

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
