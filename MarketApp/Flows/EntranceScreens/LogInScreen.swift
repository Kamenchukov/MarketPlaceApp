//
//  LogInScreen.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import SwiftUI
import XCoordinator

struct LogInScreen: View {
    private let viewModel: EntranceViewModel
    @State var firstName: String = ""
    @State var password: String = ""
    @ObservedObject var contentViewModel: CoreDataViewModel
    var users: [UserModel] = []

    
    init(viewModel: EntranceViewModel, contentViewModel: CoreDataViewModel) {
        self.viewModel = viewModel
        self.contentViewModel = contentViewModel
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome back")
                .font(Font(UIFont.SemiBold(size: 24)))
                .padding(.bottom, 80)
            VStack(spacing: 35) {
                TextField("First name", text: $firstName)
                    .foregroundColor(CustomColors.textGrey)
                    .font(Font(UIFont.Medium(size: 12)))
                    .multilineTextAlignment(TextAlignment.center)
                    .frame(width: 289, height: 29)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.backgroundGrey))
                
                ZStack {
                    TextField("Password", text: $password)
                        .foregroundColor(CustomColors.textGrey)
                        .font(Font(UIFont.Medium(size: 12)))
                        .multilineTextAlignment(TextAlignment.center)
                        .frame(width: 289, height: 29)
                        .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.backgroundGrey))
                        HStack {
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image("eye")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Spacer()
                    }
            }
        }

            Button {
                for i in 0..<contentViewModel.users.count {
                    if firstName == contentViewModel.users[i].firstName
//                        && password == contentViewModel.users[i].password
                    {
                        print("Correct")
                        viewModel.showTabBar()
                    }
                }
                print("Log in")
            } label: {
                Text("Login")
                    .font(Font(UIFont.Bold(size: 16)))
                    .foregroundColor(.white)
                    .frame(width: 289, height: 46)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.buttonsColor))
            }.padding(.top, 99)
            Spacer()
        }.background(CustomColors.backgroundColorMain)
    }
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen(viewModel: EntranceViewModel(router: .previewMock()), contentViewModel: CoreDataViewModel())
    }
}

