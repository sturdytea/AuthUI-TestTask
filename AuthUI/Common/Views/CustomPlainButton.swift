//
//
// CustomPlainButton.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class CustomPlainButton: UIButton {
    
    init(_ text: String) {
        super.init(frame: .zero)
        setupView(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(_ text: String) {
        titleLabel?.font = .urbanistMediumFont(ofSize: 14)
        titleLabel?.textColor = .systemBlue
        titleLabel?.textAlignment = .center
        
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.systemBlue,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
