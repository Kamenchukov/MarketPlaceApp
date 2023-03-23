//
//  FlashSaleViewCell.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 14.03.2023.
//

import SwiftUI

struct FlashSaleViewCell: View {
    private let flashSaleItem: MainViewModel.FlashModelConverted
    
    init(flashSaleItem: MainViewModel.FlashModelConverted) {
        self.flashSaleItem = flashSaleItem
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: flashSaleItem.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                Image("Image1")
                    .resizable()
                    .frame(width: 174, height: 221)
            }
            .frame(width: 174, height: 221)
            .cornerRadius(15)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Image("logo")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .offset(x:20,y:-25)
                            .padding(.bottom)
                            .padding(.trailing, 50)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 49, height: 18)
                                .foregroundColor(.red)
                            Text("\(flashSaleItem.discount)")
                                .colorInvert()
                                .font(Font(UIFont.Bold(size: 10)))
                        }.offset(x:50, y:-25)
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 49.6, height: 17)
                            .foregroundColor(CustomColors.backgroundGreyLight.opacity(0.8))
                        Text(flashSaleItem.category)
                            .font(Font(UIFont.Bold(size: 8)))
                    }
                    .offset(x:25)
                    
                    Text(flashSaleItem.name)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .frame(width: 150)
                        .font(Font(UIFont.Bold(size: 14)))
                        .offset(y: 7)
                    
                    Text("$ \(String(format: "%.2f", flashSaleItem.price))")
                        .font(Font(UIFont.Bold(size: 12)))
                        .offset(x: 25, y:15)
                }
                
                Button {
                    print("as")
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 12))
                }
                .background {
                    RoundedRectangle(cornerRadius: 14).frame(width: 28, height: 28).foregroundColor(CustomColors.backgroundGrey.opacity(0.95))
                }
                .offset(x:-35, y: 85)
                .foregroundColor(CustomColors.plusButtonColor)
                
                Button {
                    print("as")
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 18))
                }
                .background {
                    RoundedRectangle(cornerRadius: 17.5).frame(width: 35, height: 35).foregroundColor(CustomColors.backgroundGrey.opacity(0.95))
                }
                .offset(x:-25, y: 85)
                .foregroundColor(CustomColors.plusButtonColor)
            }
        }
    }
}

struct FlashSaleViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleViewCell(flashSaleItem: MainViewModel.FlashModelConverted(category: "", name: "", price: 23, discount: 23, imageUrl: ""))
    }
}
