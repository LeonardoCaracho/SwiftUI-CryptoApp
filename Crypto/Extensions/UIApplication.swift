//
//  UIApplication.swift
//  Crypto
//
//  Created by Leonardo Caracho on 20/07/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
