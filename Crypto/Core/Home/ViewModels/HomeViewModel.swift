//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Leonardo Caracho on 12/07/23.
//

import Foundation
import Combine

let stat1 = Statistic(title: "Market Cap", value: "$2.56Tr", percentageChange: 0.06)
let stat2 = Statistic(title: "Market Cap", value: "$2.56Tr")
let stat3 = Statistic(title: "Market Cap", value: "$2.56Tr", percentageChange: -0.10)
let stat4 = Statistic(title: "Market Cap", value: "$2.56Tr", percentageChange: -0.10)

class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var statistics: [Statistic] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        statistics = [stat1, stat2, stat3, stat4]
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercaseText = text.lowercased()
        
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercaseText) ||
            coin.symbol.lowercased().contains(lowercaseText) ||
            coin.id.lowercased().contains(lowercaseText)
        }
    }
}
