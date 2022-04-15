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

extension Array {
	subscript(safe index: Int) -> Element? {
		guard index >= 0, index < count else { return nil }
		return self[index]
	}
}

/// 289. Game of Life
/// https://leetcode.com/problems/game-of-life/
func gameOfLife(_ board: inout [[Int]]) {
	let (n, m) = (board.count - 1, board[0].count - 1)
	var next = board
	for i in 0...n {
		for j in 0...m {
			let neighbours = [
				board[safe: i-1]?[safe: j-1],
				board[safe: i-1]?[j],
				board[safe: i-1]?[safe: j+1],

				board[i][safe: j-1],
				board[i][safe: j+1],

				board[safe: i+1]?[safe: j-1],
				board[safe: i+1]?[safe: j],
				board[safe: i+1]?[safe: j+1]
			].compactMap { $0 }

			let count = neighbours.filter({ $0 == 1 }).count
			if board[i][j] == 1 {
				if count < 2 || count > 3 { next[i][j] = 0 }
			} else {
				if count == 3 { next[i][j] = 1 }
			}
		}
	}
	board = next
}
