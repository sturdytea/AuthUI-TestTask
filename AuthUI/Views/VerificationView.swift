//
//
// VerificationView.swift
// AuthUI
//
// Created by sturdytea on 24.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class VerificationView: UIView {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var instruction: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var timer: UILabel = {
        let label = UILabel()
        return label
    }()
    
//    private lazy var

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}

// MARK: - CodeTextField
private class CodeTextField: PaddedTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        borderStyle = .line
        keyboardType = .numberPad
        layer.cornerRadius = 10
        layer.masksToBounds = true
        textAlignment = .center
        textColor = .white
        font = .textFieldInputFont
        translatesAutoresizingMaskIntoConstraints = false
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        gradientLayer.colors = [
            UIColor.gradientStart.cgColor,
            UIColor.gradientSecond.cgColor,
            UIColor.gradientThird.cgColor,
            UIColor.gradientFourth.cgColor,
            UIColor.gradientEnd.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: gradientLayer.bounds, cornerRadius: 10).cgPath
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        gradientLayer.mask = shapeLayer
        layer.addSublayer(gradientLayer)
    }
}

