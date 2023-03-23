//
//  LatestGoodsView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 14.03.2023.
//

import SwiftUI

struct LatestGoodsView: View {
    private let latestData: [MainViewModel.LatestModelConverted]
    
    init(latestData: [MainViewModel.LatestModelConverted]) {
        self.latestData = latestData
    }
    
    var body: some View {
            VStack {
                HStack {
                    Text("Latest")
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
                ForEach(0..<1) { i in
                    HStack(spacing: 12) {
                        
                        ForEach(latestData) { data in
                            LatestGoodsViewCell(itemData: data)
                        }
                    
                    }
                    .padding(.leading,11)
                }
            }
        }
    }
}

//struct LatestGoodsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LatestGoodsView(latestData: <#[Item]#>)
//    }
//}
