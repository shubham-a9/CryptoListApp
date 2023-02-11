//
//  ViewModel.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/10/23.
//

import Foundation
import SwiftUI
import Combine
enum APIError: Error{
    case invalidUrl, requestError, decodingError, statusNotOk
}
let BASE_URL: String = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=5000&convert=USD"

@MainActor
final class ViewModel: ObservableObject {
    @Published private(set) var cryptoVal = [CryptoStruct]()
    
    @Published var errorMessage = ""
    @Published var hasError = false
    
    
    private var cancellable: AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    func getUsersUsingCombine() throws -> [CryptoStruct] {
        guard let url = URL(string: "\(BASE_URL)") else{
            throw APIError.invalidUrl
        }
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("ad9edb1e-fd63-4f4a-9902-be7f2d67ef7e", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        
        cancellable = URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [CryptoStruct].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { print ("Received completion: \($0).") },
                  receiveValue: { val in self.cryptoVal.append(contentsOf: val)})
        return cryptoVal
    }
}

