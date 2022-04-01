//
// Created by Arsenii on 31.03.22.
//

import Foundation

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

/// TODO: 102. Binary Tree Level Order Traversal
/// https://leetcode.com/problems/binary-tree-level-order-traversal/
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var result: [[Int]] = [[root.val]]
    let level = [root.left?.val, root.right?.val].compactMap { $0 }
    if !level.isEmpty { result.append(level) }
    result.append(contentsOf: levelOrder(root.left).dropFirst())
    result.append(contentsOf: levelOrder(root.right).dropFirst())
    return result
}