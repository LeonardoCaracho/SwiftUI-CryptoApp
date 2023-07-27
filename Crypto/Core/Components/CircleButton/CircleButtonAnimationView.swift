//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by Leonardo Caracho on 06/07/23.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scaleEffect(animate ? 1.0 : 0)
            .opacity(animate ? 0 : 1)
            .animation(.easeOut(duration: 1), value: animate)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(true))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
