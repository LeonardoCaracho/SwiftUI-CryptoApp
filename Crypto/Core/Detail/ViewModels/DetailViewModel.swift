//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Leonardo Caracho on 03/08/23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    @Published var coinDetail: CoinDetail? = nil
    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        coinDetailDataService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetail
            .sink { (returnedCoin) in
                print(returnedCoin)
            }
            .store(in: &cancellables)
    }
}
