//
//  LatestModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 20.03.2023.
//

import Foundation

struct LatestModel: Codable {
    let latest: [Item]
}

struct Item: Codable {
    let category: String
    let name: String
    let price: Int
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case imageUrl = "image_url"
      }
}
