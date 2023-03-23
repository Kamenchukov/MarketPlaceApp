//
//  ProfileCellView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import SwiftUI

struct ProfileCellView: View {
    @State var pic: String
    @State var title: String
    @State var button: Bool
    @State var price: Bool
    @State var value: String
    var currentWidth: CGFloat
    var currentHeight: CGFloat
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 40, height: 40)
                    .foregroundColor(CustomColors.backgroundGrey)
                Image(pic)
                    .resizable()
                    .frame(width: currentWidth, height: currentHeight)
            }
            .padding(.leading, 28)
            Text(title)
                .font(Font(UIFont.Medium(size: 14)))
            Spacer()
            if button {
                Image(systemName: "chevron.right")
                    .padding(.trailing, 47.5)
            } else if price {
                Text(value)
                    .padding(.trailing, 47.5)
            }
        }.background(CustomColors.backgroundColorMain)
    }
}

struct ProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCellView(pic: "folder", title: "Trade history", button: true, price: false, value: "", currentWidth: 22, currentHeight: 16)
    }
}
