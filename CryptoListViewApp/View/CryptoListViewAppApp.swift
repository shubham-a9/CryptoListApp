//
//  CryptoListViewAppApp.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/10/23.
//

import SwiftUI

@main
struct CryptoListViewAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                .navigationBarTitle(Text("Crypto App"))
            }
            .foregroundColor(.blue)
            .padding(5)
        }
    }
}
