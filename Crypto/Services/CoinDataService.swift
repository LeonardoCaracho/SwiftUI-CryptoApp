//
//  CoinDataService.swift
//  Crypto
//
//  Created by Leonardo Caracho on 13/07/23.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [Coin] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoinsCombined()
    }
    
    func getCoinsCombined() {
        guard let url = URL(
            string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        ) else { return }
        
        coinSubscription = NetWorkingManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetWorkingManager.handleCompletion,
                receiveValue: { [weak self] returnedCoins in
                    self?.allCoins = returnedCoins
                    self?.coinSubscription?.cancel()
                })
    }
}
