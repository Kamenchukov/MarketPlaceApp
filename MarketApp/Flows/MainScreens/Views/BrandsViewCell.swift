//
//  BrandsViewCell.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 17.03.2023.
//

import SwiftUI

struct BrandsViewCell: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.gray)
            .frame(width: 114, height: 149)
    }
}

struct BrandsViewCell_Previews: PreviewProvider {
    static var previews: some View {
        BrandsViewCell()
    }
}
