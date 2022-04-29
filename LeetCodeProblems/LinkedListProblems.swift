//
//  Created by Arsenii on 29.04.22.
//

import Foundation

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init(_ val: Int) {
		self.val = val
	}
}

extension ListNode: Equatable {
	public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
		lhs === rhs
	}
}

/// 141. Linked List Cycle
/// https://leetcode.com/problems/linked-list-cycle/
func hasCycle(_ head: ListNode?) -> Bool {
	var (node1, node2) = (head, head)
	repeat {
		if let next1 = node1?.next { node1 = next1 } else { return false }
		if let next2 = node2?.next?.next { node2 = next2 } else { return false }
	} while node1 != node2
	return true
}

