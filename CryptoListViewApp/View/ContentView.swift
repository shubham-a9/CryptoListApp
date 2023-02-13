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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var count: Int
    
    public init(count: Int) {
        self.count = count
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome!")
                .font(.largeTitle)
                .foregroundColor(.black)
            NavigationLink(destination: list,
                           isActive: $isActive,
                           label: { EmptyView() })
            Text("\(count)...")
                .onReceive(timer) { _ in
                    if count > 0 {
                        count -= 1
                    }
                }
                .font(.title)
                .foregroundColor(.black)
            
            
        }
        .onAppear(perform: {
            self.count = 3
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
        ContentView(count: 3)
    }
}
