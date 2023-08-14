//
//  MyNFTsViewModel.swift
//  FakeNFT
//
//  Created by Дарья Шишмакова on 08.08.2023.
//

import Foundation

final class MyNFTsViewModel {
    
    @Observable
    private(set) var nfts: [NFTModel] = []
    
    var nftIDs: [String] = []
    private let nftService: NFTService
    
    init(nftService: NFTService = NFTService()) {
        self.nftService = nftService
    }
    
    func updateNFTs() {
        var newNFTs: [NFTModel] = []
        nftIDs.forEach { nftID in
            nftService.getNFT(with: nftID) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let nft):
                    newNFTs.append(nft)
                case .failure(let error):
                    print("Ошибка получения NFT: \(error)")
                }
                self.nfts = newNFTs
            }
        }
    }
}