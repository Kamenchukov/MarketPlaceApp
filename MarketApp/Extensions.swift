//
//  Extensions.swift
//  MarketApp
//
//  Created by Константин Каменчуков on 13.03.2023.
//

import Foundation
import SwiftUI
import XCoordinator

//MARK: Colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
//MARK: Fonts
extension UIFont {
    static func Regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    
    static func Black(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Black", size: size)!
    }
    
    static func Bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
    
    static func ExtraBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ExtraBold", size: size)!
    }
    
    static func ExtraLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ExtraLight", size: size)!
    }
    
    static func Light(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Light", size: size)!
    }
    
    static func Medium(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Medium", size: size)!
    }
    
    static func SemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size)!
    }
    
    static func Thin(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Thin", size: size)!
    }
}

//MARK: MockCoordinator

extension UnownedRouter {
    static func previewMock<T: Route>() -> UnownedRouter<T> {
        return UnownedRouter(EmptyRouter<T>(), erase: { StrongRouter<T>($0) })
    }
}

final class EmptyRouter<T: Route>: Router {
    var viewController: UIViewController!
    func contextTrigger(_ route: T, with options: TransitionOptions, completion: ContextPresentationHandler?) {}
}
