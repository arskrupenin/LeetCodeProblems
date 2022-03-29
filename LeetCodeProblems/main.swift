//
//  main.swift
//  LeetCodeProblems
//
//  Created by Ars Krupenin on 29.03.22.
//

import Foundation

// MARK: - Binary Tree

public class TreeNode {

	public var val: Int
	public var left, right: TreeNode?

	public init(_ val: Int = 0, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
		self.val = val
		self.left = left
		self.right = right
	}
  }

/// 94. Binary Tree Inorder Traversal
/// https://leetcode.com/problems/binary-tree-inorder-traversal/
func inorderTraversal(_ root: TreeNode?) -> [Int] {
	guard let root = root else { return [] }
	return [
		inorderTraversal(root.left), [root.val], inorderTraversal(root.right)
	].flatMap { $0 }
}

/// 100. Same Tree
/// https://leetcode.com/problems/same-tree/
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
	if p == nil && q == nil { return true }
	guard let p = p, let q = q, p.val == q.val else { return false }
	return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}

/// 263. Ugly Number
/// https://leetcode.com/problems/ugly-number/
func isUgly(_ n: Int) -> Bool {
	if n <= 0 { return false }
	if n == 1 { return true }
	var temp = n
	while temp != 1 {
		if temp % 2 == 0 {
			temp = temp / 2
		} else if temp % 3 == 0 {
			temp = temp / 3
		} else if temp % 5 == 0 {
			temp = temp / 5
		} else {
			return false
		}
	}
	return true
}

