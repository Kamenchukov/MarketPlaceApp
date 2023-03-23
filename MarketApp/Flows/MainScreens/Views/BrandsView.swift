//
//  BrandsView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 17.03.2023.
//

import SwiftUI

struct BrandsView: View {
    var body: some View {
            VStack {
                HStack {
                    Text("Brands")
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
                    HStack(spacing: 12) {
                        ForEach(0..<5) { data in
                            BrandsViewCell()
                        }.offset(x:10)
                    }
            }
        }
    }
}

struct BrandsView_Previews: PreviewProvider {
    static var previews: some View {
        BrandsView()
    }
}
