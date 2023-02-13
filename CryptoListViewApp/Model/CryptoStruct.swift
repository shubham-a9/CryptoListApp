//
//  CryptoStruct.swift
//  CryptoListViewApp
//
//  Created by Anurag Shubham on 2/10/23.
/*
 [
    {
         "id": 3408,
         "name": "USD Coin",
         "symbol": "USDC",
         "slug": "usd-coin",
         "num_market_pairs": 10012,
         "date_added": "2018-10-08T00:00:00.000Z",
         "tags": [
             "medium-of-exchange",
             "stablecoin",
             "asset-backed-stablecoin",
             "fantom-ecosystem",
             "arbitrum-ecosytem",
             "moonriver-ecosystem",
             "bnb-chain",
             "usd-stablecoin",
             "optimism-ecosystem"
         ],
         "max_supply": null,
         "circulating_supply": 41369798100.31214,
         "total_supply": 41369798100.31214,
         "platform": {
             "id": 1027,
             "name": "Ethereum",
             "symbol": "ETH",
             "slug": "ethereum",
             "token_address": "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48"
         },
         "cmc_rank": 5,
         "self_reported_circulating_supply": null,
         "self_reported_market_cap": null,
         "tvl_ratio": null,
         "last_updated": "2023-02-10T20:28:00.000Z",
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
     }
]
 */
import Foundation
struct CryptoStruct: Identifiable, Codable {
    let id: Int
    let name: String
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case quote = "quote"
        case id
        case name
    }
}
