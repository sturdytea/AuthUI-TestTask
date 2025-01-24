//
//
// CountryCode.swift
// AuthUI
//
// Created by sturdytea on 24.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

enum CountryCode: String, CaseIterable {
    case kz = "+77"
    case cn = "+86"
    case kg = "+996"
    case ru = "+7"
    case tr = "+90"
    case uz = "+998"
    
    var name: String {
        switch self {
        case .kz: "Казахстан"
        case .cn: "Китай"
        case .kg: "Кыргызстан"
        case .ru: "Россия"
        case .tr: "Турция"
        case .uz: "Узбекистан"
        }
    }
}
