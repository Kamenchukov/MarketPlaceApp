//
//  FlashSaleView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 14.03.2023.
//

import SwiftUI

struct FlashSaleView: View {
    private let flashSalesData: [MainViewModel.FlashModelConverted]
    
    init(flashSalesData: [MainViewModel.FlashModelConverted]) {
        self.flashSalesData = flashSalesData
    }

    var body: some View {
            VStack {
                HStack {
                    
                    Text("Flash Sale")
                        .font(Font(UIFont.SemiBold(size: 18)))
                        .padding(.leading)
                    Spacer()
                    Button {
                        print("view all")
                    } label: {
                        Text("View all")
                            .foregroundColor(CustomColors.textGrey)
                            .font(Font(UIFont.Regular(size: 12)))
                            .padding(.trailing)
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(flashSalesData) { data in
                            FlashSaleViewCell(flashSaleItem: data)
                        }
                    }
            }
        }
    }
}

struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView(flashSalesData: [MainViewModel.FlashModelConverted(category: "", name: "", price: 23, discount: 20, imageUrl: "")])
    }
}
