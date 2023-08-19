//
//  XMarkButton.swift
//  Crypto
//
//  Created by Leonardo Caracho on 14/08/23.
//

import SwiftUI

struct XMarkButton: View {
    @Binding var close: Bool
    
    var body: some View {
        Button(action: {
            close = false
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton(close: .constant(true))
    }
}
