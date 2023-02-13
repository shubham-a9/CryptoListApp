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
            Text("$ \(val.quote.usd.price)")
                .foregroundColor(.green)

            Button(action: {
                var newArray = [Int]()
                if (viewModel.defaultsArray.contains(val.id))  {
                    newArray = viewModel.defaultsArray.filter({$0 != val.id})
                    val.favorite.toggle()
                }else {
                    newArray = viewModel.defaultsArray
                    newArray.append(val.id)
                    val.favorite.toggle()
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
        ListRow(val: CryptoStruct(id: 1, name: "Bitcoin", quote: Quote(usd: USD(price: 1.023467))))
    }
}
