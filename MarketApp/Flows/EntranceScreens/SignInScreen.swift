//
//  SignInScreen.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//
import SwiftUI

struct SignInScreen: View {
    var navigationViewModel: EntranceViewModel
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State private var isEmailValid: Bool = true
    var contentViewModel: CoreDataViewModel
    @StateObject var viewModel: SignInViewModel
    

    var body: some View {
        VStack {
            Spacer()
            Text("Sign in")
                .font(Font(UIFont.SemiBold(size: 24)))
                .frame(width: 87.52, height: 25.3)
                .padding(.bottom, 80)
            
            VStack(spacing: 35) {
                TextField("First name", text: $viewModel.firstName)
                    .foregroundColor(CustomColors.textGrey)
                    .font(Font(UIFont.Medium(size: 12)))
                    .multilineTextAlignment(TextAlignment.center)
                    .frame(width: 289, height: 29)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.backgroundGrey))
                
                TextField("Last name", text: $viewModel.lastName)
                    .foregroundColor(CustomColors.textGrey)
                    .font(Font(UIFont.Medium(size: 12)))
                    .multilineTextAlignment(TextAlignment.center)
                    .frame(width: 289, height: 29)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.backgroundGrey))
                
                TextField("Email", text: $viewModel.email, onEditingChanged: { isChanged in
                    if !isChanged {
                        if self.textFieldValidatorEmail(self.email) {
                            self.isEmailValid = true
                        } else {
                            self.isEmailValid = false
                            self.email = ""
                        }
                    }
                })
                    .foregroundColor(CustomColors.textGrey)
                    .font(Font(UIFont.Medium(size: 12)))
                    .multilineTextAlignment(TextAlignment.center)
                    .frame(width: 289, height: 29)
                    .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.backgroundGrey))
                if !self.isEmailValid {
                           Text("Email is Not Valid")
                               .font(Font(UIFont.Medium(size: 12)))
                               .foregroundColor(Color.red)
                       }
                
                Button {
                    viewModel.addUser(viewModel: contentViewModel)
                    navigationViewModel.showTabBar()
                    print("sign in")
                } label: {
                    Text("Sign in")
                        .font(Font(UIFont.Bold(size: 16)))
                        .foregroundColor(.white)
                        .frame(width: 289, height: 46)
                        .background(RoundedRectangle(cornerRadius: 15,style: .continuous).foregroundColor(CustomColors.buttonsColor))
                }
            }
            
            HStack {
                Text("Already have an account?")
                    .foregroundColor(CustomColors.textGrey)
                    .frame(height: 9.4)
                    .font(Font(UIFont.Regular(size: 10)))
                    .padding(.leading, 52)
                Button {
                    print("Log In")
                    navigationViewModel.showLogIn()
                } label: {
                    Text("Log in")
                        .font(Font(UIFont.Regular(size: 10)))
                        .foregroundColor(CustomColors.buttonsColor)
                }
                Spacer()
            }.padding(.top, 6)
            
            HStack(spacing: 11.7) {
                Image("google")
                    .resizable()
                    .frame(width: 23.8, height: 24.3)
                   
                Button {
                    navigationViewModel.showTabBar()
                    print("google")
                } label: {
                    Text("Sign in with Google")
                        .font(Font(UIFont.Medium(size: 12)))
                        .foregroundColor(.black)
                }

            }.padding(.top, 74)
             .padding(.bottom, 38)
            
            HStack(spacing: 14) {
                Image(systemName:"apple.logo")
                    .resizable()
                    .frame(width: 18.4, height: 21.9)
                Button {
                    navigationViewModel.showTabBar()
                    print("apple")
                } label: {
                    Text("Sign in with Apple")
                        .font(Font(UIFont.Medium(size: 12)))
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }.background(CustomColors.backgroundColorMain)
    }
    
    //MARK: Email Validator
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen(navigationViewModel: EntranceViewModel(router: .previewMock()), contentViewModel: CoreDataViewModel(), viewModel: SignInViewModel(firstName: "", lastName: "", email: ""))
    }
}
