//
//  MainViewModel.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 18.03.2023.
//

import Foundation
import XCoordinator
import SwiftUI

final class MainViewModel: ObservableObject {
    @ObservedObject var network = NetworkManager()
    
    private let latestUrl = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    @Published var latest: [LatestModelConverted] = []
    private var flashSaleUrl = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    @Published var flashSales: [FlashModelConverted] = []
    
    private let router: UnownedRouter<HomeRoute>
    
    init(router: UnownedRouter<HomeRoute>) {
        self.router = router
    }
    
    func getData() {
        DispatchQueue.main.async {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.network.getLatestData(url: self.latestUrl) { latestData in
                    self.latest = self.convert(model: latestData.latest)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.network.getFlashSaleData(url: self.flashSaleUrl) { flashSalesData in
                    self.flashSales = self.converFlash(model: flashSalesData.flashSale)
                }
            }
        }
    }
    
    func showHome() {
        router.trigger(.home)
    }
    
    func showItem() {
        router.trigger(.item)
    }
}

extension MainViewModel {
    struct LatestModelConverted: Identifiable {
        var id = UUID()
        let category: String
        let name: String
        let price: Int
        let imageUrl: String
    }
    
    func convert(model: [Item]) -> [LatestModelConverted] {
        return model.map {
            LatestModelConverted(category: $0.category, name: $0.name, price: $0.price, imageUrl: $0.imageUrl)
        }
    }
}

extension MainViewModel {
    struct FlashModelConverted: Identifiable {
        var id = UUID()
        let category: String
        let name: String
        let price: Double
        let discount: Int
        let imageUrl: String
    }
    
    func converFlash(model: [SaleItem]) -> [FlashModelConverted] {
        return model.map {
            FlashModelConverted(category: $0.category, name: $0.name, price: $0.price, discount: $0.discount, imageUrl: $0.imageUrl)
        }
    }
}
