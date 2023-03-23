//
//  ProfileScreenView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import SwiftUI

struct ProfileScreenView: View {
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Spacer()
            Image("foto")
                 .resizable()
                 .frame(width: 60, height: 60)
            Button {
                print("change photo")
            } label: {
                Text("Change photo")
                    .foregroundColor(CustomColors.textGrey)
                    .font(Font(UIFont.Regular(size: 8)))
            }

             Text("Satria Adhi Pradana")
                .font(Font(UIFont.Bold(size: 14)))
                .padding()
            ZStack {
                Button {
                    print("Upload item")
                } label: {
                    Text("Upload item")
                        .font(Font(UIFont.Bold(size: 16)))
                        .foregroundColor(.white)
                        .frame(width: 290, height: 40)
                        .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.buttonsColor))
                }
                    Image("upload")
                        .resizable()
                        .frame(width: 10, height: 12.5)
                        .offset(x:-82.56)
            }
            VStack(spacing: 25) {
                ProfileCellView(pic: "folder", title: "Trade store", button: true, price: false, value: "", currentWidth: 22, currentHeight: 16)
                ProfileCellView(pic: "folder", title: "Paymet method", button: true, price: false, value: "", currentWidth: 22, currentHeight: 16)
                ProfileCellView(pic: "folder", title: "Balance", button: false, price: true, value: "$ 1593", currentWidth: 22, currentHeight: 16)
                ProfileCellView(pic: "folder", title: "Trade history", button: true, price: false, value: "", currentWidth: 22, currentHeight: 16)
                ProfileCellView(pic: "update", title: "Restore Purchase", button: true, price: false, value: "", currentWidth: 22, currentHeight: 18)
                ProfileCellView(pic: "question", title: "Help", button: false, price: false, value: "", currentWidth: 20, currentHeight: 20)
                ProfileCellView(pic: "log out", title: "Log out", button: false, price: false, value: "", currentWidth: 18, currentHeight: 18)
                    .onTapGesture {
                        viewModel.logOut()
                    }
            }
            Spacer()
        }.background(CustomColors.backgroundColorMain)
            .onAppear {
                print(AppDelegate.shared.fetchData())
            }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView(viewModel: ProfileViewModel(router: .previewMock()))
    }
}
