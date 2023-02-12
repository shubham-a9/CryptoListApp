//
//  ListRow.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/11/23.
//

import SwiftUI

struct ListRow: View {
    @State private var val: CryptoStruct
    var defaultsArray: [Int] {
        get {
            return UserDefaults.standard.value(forKey: "favorites") as? [Int] ?? []
        }
    }
    
    var defaults = UserDefaults.standard
    
    public init(val: CryptoStruct) {
        self.val = val
    }
    
    var body: some View {
        HStack {
            Text("\(val.name)")
            Spacer()
            Text("$ \(val.quote.usd.price)")
            Button(action: {
                var newArray = [Int]()
                if (defaultsArray.contains(val.id))  {
                    newArray = defaultsArray.filter({$0 != val.id})
                }else {
                    newArray = defaultsArray
                    newArray.append(val.id)
                }
                defaults.removeObject(forKey: "favorites")
                defaults.set(newArray, forKey: "favorites")
            }) {
                if (defaultsArray.contains(val.id))  {
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
