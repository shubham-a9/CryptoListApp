//
//  ListRow.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/11/23.
//

import SwiftUI

struct ListRow: View {
    @State private var val: CryptoStruct
    @EnvironmentObject var viewModel: ViewModel
    var defaults = UserDefaults.standard
    
    public init(val: CryptoStruct) {
        self.val = val
    }
    
    var body: some View {
        HStack {
            Text("\(val.name)")
                .foregroundColor(.black)
            Spacer()

            if (val.quote.usd.percentChangein1Hr > 0) {
                Text("$ \(val.quote.usd.price)")
                    .foregroundColor(.green)
                Image(systemName: "arrowtriangle.up.fill")
                    .foregroundColor(Color.green)
            }else {
                Text("$ \(val.quote.usd.price)")
                    .foregroundColor(.red)
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color.red)
            }
            
            Button(action: {
                var newArray = [Int]()
                if (viewModel.defaultsArray.contains(val.id))  {
                    newArray = viewModel.defaultsArray.filter({$0 != val.id})
                }else {
                    newArray = viewModel.defaultsArray
                    newArray.append(val.id)
                }
                defaults.removeObject(forKey: "favorites")
                defaults.set(newArray, forKey: "favorites")
                viewModel.defaultsArray = newArray
            }) {
                if (viewModel.defaultsArray.contains(val.id))  {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(val: CryptoStruct(id: 1, name: "Bitcoin", quote: Quote(usd: USD(price: 1.023467, percentChangein1Hr: 0.001)))).environmentObject(ViewModel())
    }
}
