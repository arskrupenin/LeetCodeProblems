//
//  main.swift
//  LeetCodeProblems
//
//  Created by Ars Krupenin on 29.03.22.
//

import Foundation

/// TODO: 436. Find Right Interval
/// https://leetcode.com/problems/find-right-interval/
func findRightInterval(_ intervals: [[Int]]) -> [Int] {
	[]
}

/// TODO: 300. Longest Increasing Subsequence
/// https://leetcode.com/problems/longest-increasing-subsequence/
func lengthOfLIS(_ nums: [Int]) -> Int {
	0
}

/*
 Currency rates

 You are given:
2 currencies (SRC and DST) in the format SRCDST e.g. GBPUSD
a dictionary, called rates, of currency pairs and their exchange rate,
e.g.: ["GBPUSD" : 1.35] means that 1 GBP = 1.35 USD
The goal is to write a function that, using exchange rates from the rates dictionary, finds:
the exchange rate from SRC to DST performing the minimum possible number of exchanges
list of currencies that were exchanged to get from from SRC to DST

 Example:
You are given set of rates as following rates: [GBPRUB: 100, USDGBP: 0.7, GBPEUR: 0.83, EURRUB: 86.3]
And you have to find the exchange rate from USD to RUB
The resulting rate would be 70 and is obtained by exchanging USDGBPRUB:
USD to GBP => 1 USD = 0.7 GBP GBP to RUB => 0.7 GBP = 70 RUB

 Constraints:
Currencies are identified by 3-char currency codes, as defined by ISO 4217
There is always a single, valid, solution
*/

struct Pair {
	let left: String
	let right: String

	init(_ string: String) {
		let mid = string.index(string.startIndex, offsetBy: 3)
		self.left = String(string[string.startIndex..<mid])
		self.right = String(string[mid..<string.endIndex])
	}
}

func getPathRate(pair: String, rates: [String: Int]) -> (path: String, rate: Int) {
	if let rate = rates[pair] { return (pair, rate) }
	return ("", 0)
}

print(getPathRate(pair: "USDRUB", rates: ["USDRUB": 3]))
