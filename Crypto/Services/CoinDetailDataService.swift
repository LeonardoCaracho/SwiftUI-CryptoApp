//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Leonardo Caracho on 03/08/23.
//

import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetail: CoinDetail? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getCoinDetail()
    }
    
    func getCoinDetail() {
        guard let url = URL(
            string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
        ) else { return }
        
        coinDetailSubscription = NetWorkingManager.download(url: url)
            .decode(type: CoinDetail.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetWorkingManager.handleCompletion,
                receiveValue: { [weak self] returnedCoin in
                    self?.coinDetail = returnedCoin
                    self?.coinDetailSubscription?.cancel()
                })
    }
}
