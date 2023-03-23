//
//  MainScreenView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 14.03.2023.
//

import SwiftUI

struct MainScreenView: View {
    private let placeholder: String
    @State private var text = ""
    @Binding var focused: Bool
    
   @ObservedObject var viewModel: MainViewModel

    init(
        viewModel: MainViewModel,
        text: String = "",
        placeholder: String = "What are you loking for?",
        focused: Binding<Bool>
    ) {
        self.viewModel = viewModel
        self.text = text
        self.placeholder = placeholder
        self._focused = focused
    }
    //MARK: Body
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                createTopSide()
                    .padding(.bottom)
                createSearchView()
                CategoriesView()
                LatestGoodsView(latestData: viewModel.latest)
                FlashSaleView(flashSalesData: viewModel.flashSales)
                BrandsView()
                Spacer()
            }
        }
        .background(CustomColors.backgroundColorMain)
        .onAppear {
            viewModel.getData()
        }
    }
    
    @ViewBuilder
    private func createTopSide() -> some View {
        HStack {
            Image("menu")
                .resizable()
                .frame(width: 22, height: 24)
                .padding(.leading)
            Spacer()
            Text("Trade by")
                .font(Font(UIFont.Bold(size: 16)))
            Text("bata")
                .font(Font(UIFont.Bold(size: 16)))
                .foregroundColor(CustomColors.buttonsColor)
            Spacer()
            VStack {
                Image("logo2")
                    .resizable()
                    .frame(width: 31, height: 29)
                    .background {
                        Button {
                            print("change")
                        } label: {
                            Text("Location v")
                                .frame(width: 40)
                                .font(Font(UIFont.Regular(size: 7)))
                                .foregroundColor(CustomColors.plusButtonColor)
                        }.offset(y: 25)
                    }
            }.padding(.trailing, 25)
        }
    }
    
    @ViewBuilder
    private func createSearchView() -> some View {
        HStack {
            TextField(placeholder, text: $text) { isEditing in
                focused = isEditing
            }
            .padding(.leading, 70)
            .font(Font(UIFont.Regular(size: 10)))
            .frame(width: 262, height: 24)
            if !focused {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 9, height: 9)
                    .foregroundColor(.black)
                    .transition(.opacity.combined(with: .move(edge: .leading)))
                    .padding(.trailing)
            }
        }
        .background(content: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(CustomColors.grayBarItem)
        })
        .padding(.horizontal, 16)
        .animation(.default, value: focused)
    }
    
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainViewModel(router: .previewMock()), focused: .constant(false))
    }
}
