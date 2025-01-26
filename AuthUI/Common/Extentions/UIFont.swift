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
    private static let inter18 = "Inter_18pt"
    private static let inter24 = "Inter_24pt"
    private static let poppins = "Poppins"
    private static let urbanist = "Urbanist"
    
    private enum Style: String {
        case light = "-Light"
        case medium = "-Medium"
        case regular = "-Regular"
    }
    
    static let actionButtonFont = UIFont(name: "\(urbanist)\(Style.regular.rawValue)", size: 16)
    
    static let hintFont = UIFont(name: "\(urbanist)\(Style.medium.rawValue)", size: 14)
    static let navigationBarTitleFont = UIFont(name: "\(urbanist)\(Style.medium.rawValue)", size: 20)
    static let textFieldHintFont = UIFont(name: "\(urbanist)\(Style.regular.rawValue)", size: 13)
    static let textFieldInputFont = UIFont(name: "\(inter18)\(Style.medium.rawValue)", size: 19)
    static let verificationCodeInputFont = UIFont(name: "\(inter18)\(Style.medium.rawValue)", size: 22)
    static let verificationTitleFont = UIFont(name: "\(inter18)\(Style.medium.rawValue)", size: 24)
    static let verificationInstructionFont = UIFont(name: "\(inter18)\(Style.light.rawValue)", size: 16)
    static let timerFont = UIFont(name: "\(inter18)\(Style.regular.rawValue)", size: 16)
    
    
}
