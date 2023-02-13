//
//  Quote.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/13/23.
//
/*
 "quote": {
     "USD": {
         "price": 1.0000747365630451,
         "volume_24h": 4003426121.9379296,
         "volume_change_24h": 0.5372,
         "percent_change_1h": 0.00127592,
         "percent_change_24h": 0.03068522,
         "percent_change_7d": 0.00794554,
         "percent_change_30d": 0.00099326,
         "percent_change_60d": 0.00809758,
         "percent_change_90d": -0.0107852,
         "market_cap": 41372889936.83603,
         "market_cap_dominance": 4.0767,
         "fully_diluted_market_cap": 41372889936.84,
         "tvl": null,
         "last_updated": "2023-02-10T20:28:00.000Z"
     }
 }
 */
import Foundation
struct Quote: Codable {
    let usd: USD
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
