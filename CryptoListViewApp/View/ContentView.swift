//
//  ContentView.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    let list = ListView()
    let color = Color.init("black_1")
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome!")
                .font(.largeTitle)
            NavigationLink(destination: list,
                           isActive: $isActive,
                           label: { EmptyView() })
            Text("Loading...")
        }
        .background(color)
        .onAppear(perform: {
            self.gotoList(time: 3)
        })
    }
    
    func gotoList(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
