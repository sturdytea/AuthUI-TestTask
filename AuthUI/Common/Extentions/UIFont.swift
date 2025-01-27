//
//
// UIFont.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

extension UIFont {
    
    private enum Font: String {
        case inter18 = "Inter_18pt"
        case inter24 = "Inter_24pt"
        case poppins = "Poppins"
        case urbanist = "Urbanist"
    }
    
    private enum Style: String {
        case light = "-Light"
        case medium = "-Medium"
        case regular = "-Regular"
    }
    
    static func urbanistLightFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.urbanist)\(Style.light)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func urbanistMediumFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.urbanist)\(Style.medium)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func urbanistRegularFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.urbanist)\(Style.regular)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func interLightFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.inter18)\(Style.light)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func interMediumFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.inter18)\(Style.medium)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func interRegularFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.inter18)\(Style.regular)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    static func poppinsMediumFont(ofSize fontSize: CGFloat) -> UIFont {
        UIFont(name: "\(Font.poppins)\(Style.medium)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
