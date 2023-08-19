//
//  CoinImageService.swift
//  Crypto
//
//  Created by Leonardo Caracho on 18/07/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
            print("Retrieved image from file manager!")
        } else {
            downloadCoinImage()
            print("Donwloading image now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(
            string: coin.image
        ) else { return }
        
        imageSubscription = NetWorkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetWorkingManager.handleCompletion,
                receiveValue: { [weak self] returnedImage in
                    guard let self = self, let downloadedImage = returnedImage else { return }
                    self.image = downloadedImage
                    self.imageSubscription?.cancel()
                    self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
                })
    }
}
