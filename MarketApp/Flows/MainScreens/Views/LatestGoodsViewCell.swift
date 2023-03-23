//
//  LatestGoodsViewCell.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 14.03.2023.
//

import SwiftUI

struct LatestGoodsViewCell: View {
    private let itemData: MainViewModel.LatestModelConverted
    
    init(itemData: MainViewModel.LatestModelConverted) {
        self.itemData = itemData
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: itemData.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                Image("Image")
                    .resizable()
                    .frame(width: 114, height: 149)
            }.frame(width: 114, height: 149)
                .cornerRadius(15)

            HStack(spacing: 24.9) {
                VStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 35, height: 12)
                            .foregroundColor(CustomColors.backgroundGreyLight.opacity(0.8))
                            .offset(x: -3, y: -15)
                        Text(itemData.category)
                            .font(Font(UIFont.Bold(size: 6)))
                            .offset(x: -3, y: -15)
                    }
                    
                    Text(itemData.name)
                        .font(Font(UIFont.Bold(size: 8)))
                        .offset(x: -3, y: -15)
                    
                    Text("$ \(itemData.price)")
                        .font(Font(UIFont.Bold(size: 7)))
                        .offset(x: -3)
                        .padding(.bottom, 7)
                }
                
                Button {
                    print("as")
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 11))
                }
                .background {
                    RoundedRectangle(cornerRadius: 10).frame(width: 20, height: 20).foregroundColor(CustomColors.backgroundGrey.opacity(0.95))
                }
                .padding(.top)
                .foregroundColor(CustomColors.plusButtonColor)
            }
        }
    }
}

//struct LatestGoodsViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        LatestGoodsViewCell(itemData: Item(id: 1, category: "", name: "", price: 20, imageUrl: ""))
//    }
//}
