//
//  CoinDataService.swift
//  Crypto
//
//  Created by Leonardo Caracho on 13/07/23.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketData? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(
            string: "https://api.coingecko.com/api/v3/global"
        ) else { return }
        
        marketDataSubscription = NetWorkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetWorkingManager.handleCompletion,
                receiveValue: { [weak self] returnedGlobalData in
                    self?.marketData = returnedGlobalData.data
                    self?.marketDataSubscription?.cancel()
                })
    }
}
