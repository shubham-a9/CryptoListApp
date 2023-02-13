//
//  ListView.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/11/23.
//

import SwiftUI
/*
 [{
    "id": 3408,
    "name": "USD Coin",
    "quote": {
        "USD": {
            "price": 1.0000747365630451
                }
            }
 }]
 */
struct ListView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showFavoritesOnly = false
    
    var filteredCryptos: [CryptoStruct] {
        viewModel.cryptoVal.filter { val in
            (!showFavoritesOnly || viewModel.defaultsArray.contains(val.id))
        }
    }
    
    var body: some View {
        List{
            Toggle(isOn: $showFavoritesOnly) {
                Text("Show Favorites Only")
                    .foregroundColor(.black)
            }
            ForEach(filteredCryptos){val in
                ListRow(val: val)
                    .environmentObject(viewModel)
            }
        }
        .listStyle(.insetGrouped)
        .navigationBarTitle(Text("Cryptocurrencies"))
        .task {
            do {
                let  _ = try viewModel.getListOfCryptos()
            }catch {
                print("Error in getListOfCryptos")
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
