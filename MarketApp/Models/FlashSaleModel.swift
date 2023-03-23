//
//  FlashSaleModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 20.03.2023.
//

import Foundation

struct FlashSaleModel: Codable {
    let flashSale: [SaleItem]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct SaleItem: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case discount
        case imageUrl = "image_url"
    }
    
}
