//
//  CategoriesView.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 14.03.2023.
//

import SwiftUI

struct CategoriesView: View {
    
    var body: some View {
            ScrollView(.horizontal) {
                HStack (spacing: 17) {
                    VStack(spacing: 14.37) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: 42, height: 42)
                                .foregroundColor(CustomColors.grayBarItem)
                            
                            Button {
                               print("tapped")
                            } label: {
                                Image("phones")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 12.5, height: 20)
                            }
                        }

                        Text("Phones")
                            .font(Font.custom("Mark Pro", size: 12))
                            .foregroundColor(CustomColors.textGrey)
                    }.padding(.leading, 15)
                    
                    VStack(spacing: 14.37)  {
                        ZStack {
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: 42, height: 42)
                                .foregroundColor(CustomColors.grayBarItem)
                            Button {
                                print("tapped")
                            } label: {
                                Image("headphones")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 19.7, height: 17.3)
                            }
                        }
                        
                        Text("Headphones")
                            .font(Font.custom("Mark Pro", size: 12))
                            .foregroundColor(CustomColors.textGrey)
                    }
                    VStack(spacing: 14.37) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: 42, height: 42)
                                .foregroundColor(CustomColors.grayBarItem)
                            Button {
                                print("tapped")
                            } label: {
                                Image("games")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 19.86, height: 9.93)
                        }
                    }
                       
                        Text("Games")
                            .font(Font.custom("Mark Pro", size: 12))
                            .foregroundColor(CustomColors.textGrey) 
                    }
                    
                    VStack(spacing: 14.37) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: 42, height: 42)
                                .foregroundColor(CustomColors.grayBarItem)
                            
                            Button {
                                print("tapped")
                            } label: {
                                Image("car")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 20.71, height: 14.5)
                            }
                        }
                        
                        Text("Books")
                            .font(Font.custom("Mark Pro", size: 12))
                            .foregroundColor(CustomColors.textGrey)
                    }
                    
                    VStack(spacing: 14.37) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: 42, height: 42)
                                .foregroundColor(CustomColors.grayBarItem)
                            
                            Button {
                                print("tapped")
                            } label: {
                                Image("bed")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 21.67, height: 13)
                            }
                        }
                        
                        Text("Furniture")
                            .font(Font.custom("Mark Pro", size: 12))
                            .foregroundColor(CustomColors.textGrey)
                    }
                    
                    VStack(spacing: 14.37) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: 42, height: 42)
                                .foregroundColor(CustomColors.grayBarItem)
                            
                            Button {
                                print("tapped")
                            } label: {
                                Image("kids")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 21.25, height: 17)
                            }
                        }

                        Text("Kids")
                            .font(Font.custom("Mark Pro", size: 12))
                            .foregroundColor(CustomColors.textGrey)
                    }
                }
            }
            .background(CustomColors.backgroundColorMain)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
