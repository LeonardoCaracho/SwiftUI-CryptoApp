//
//  Statistic.swift
//  Crypto
//
//  Created by Leonardo Caracho on 21/07/23.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

let newModel = Statistic(title: "", value: "")
