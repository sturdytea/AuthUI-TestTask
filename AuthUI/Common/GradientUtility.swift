//
//
// GradientUtility.swift
// AuthUI
//
// Created by sturdytea on 27.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

public struct GradientUtility {
    
    static let colors: [CGColor] = [
        UIColor.gradientStart.cgColor,
        UIColor.gradientSecond.cgColor,
        UIColor.gradientThird.cgColor,
        UIColor.gradientFourth.cgColor
    ]
    
    static let disabledColors: [CGColor]  = [
        UIColor.disabledStart.cgColor,
        UIColor.disabledEnd.cgColor
    ]
    
    static func createGradient(frame: CGRect?) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        return gradientLayer
    }
    
    static func createReversedGradient(frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer
    }
}
