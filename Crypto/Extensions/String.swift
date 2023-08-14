//
//  String.swift
//  Crypto
//
//  Created by Leonardo Caracho on 14/08/23.
//

import Foundation

extension String {
    var removingHtmlOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
