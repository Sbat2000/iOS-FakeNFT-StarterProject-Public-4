//
//  Profile.swift
//  FakeNFT
//
//  Created by Дарья Шишмакова on 05.08.2023.
//

import Foundation

struct ProfileModel: Codable {
    let name: String
    let avatar: String
    let description: String
    let website: String
    let nfts: [String]
    let likes: [String]
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatar
        case description
        case website
        case nfts
        case likes
        case id
    }
}