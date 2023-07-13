//
//  CryptoApp.swift
//  Crypto
//
//  Created by Leonardo Caracho on 05/07/23.
//

import SwiftUI

@main
struct CryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .hidden()
            }
            .environmentObject(vm)
        }
    }
}
