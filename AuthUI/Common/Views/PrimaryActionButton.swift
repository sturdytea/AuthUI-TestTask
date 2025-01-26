//
//
// PrimaryActionButton.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PrimaryActionButton: UIButton {
    let gradientLayer = CAGradientLayer()
    private let buttonHeight: CGFloat = 56
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        tintColor = .white
        clipsToBounds = true
        titleLabel?.font = .urbanistRegularFont(ofSize: 16)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
        layer.borderColor = .none
        layer.cornerRadius = bounds.height / 2
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled == false {
                gradientLayer.colors = [UIColor.disabledStart.cgColor,
                                        UIColor.disabledEnd.cgColor]

            } else {
                gradientLayer.colors = [UIColor.gradientStart.cgColor,
                                        UIColor.gradientSecond.cgColor,
                                        UIColor.gradientThird.cgColor,
                                        UIColor.gradientFourth.cgColor,
                                        UIColor.gradientEnd.cgColor]

            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: buttonHeight)
    }
}
