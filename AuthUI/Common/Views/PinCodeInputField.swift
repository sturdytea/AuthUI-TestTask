//
//
// PinCodeInputField.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PinCodeInputField: UIView {
    
    private var pinCodeIndicators: [Dot] = []
    let pinCodeLength = 4
    
    private lazy var background: Background = {
        let view = Background()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var indicatorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.layer.cornerRadius = 50
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.keyboardType = .numberPad
        textField.tintColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        for i in 0..<pinCodeLength {
            let indicator = Dot()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            pinCodeIndicators.append(indicator)
            indicatorStackView.addArrangedSubview(indicator)
        }
        
        addSubview(background)
        background.addSubview(indicatorStackView)
        background.addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            background.heightAnchor.constraint(equalToConstant: 52),
            
            indicatorStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorStackView.heightAnchor.constraint(equalToConstant: 10),
            
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func focusInput() {
        textField.becomeFirstResponder()
    }
    
    func updateDots(filledCount: Int) {
        for (index, dot) in pinCodeIndicators.enumerated() {
            if index < filledCount {
                dot.gradientLayer.colors = [UIColor.gradientStart.cgColor,
                                            UIColor.gradientSecond.cgColor,
                                            UIColor.gradientThird.cgColor,
                                            UIColor.gradientFourth.cgColor,
                                            UIColor.gradientEnd.cgColor]
            } else {
                dot.gradientLayer.colors = [UIColor.gray.cgColor]
            }
        }
    }
    
    func pinCodeComplete(pin: String) {
        background.gradientLayer.colors = [
            UIColor.gradientStart.cgColor,
            UIColor.gradientSecond.cgColor,
            UIColor.gradientThird.cgColor,
            UIColor.gradientFourth.cgColor,
            UIColor.gradientEnd.cgColor
        ]
        print("Entered PIN: \(pin)")
    }
}

// MARK: - UITextFieldDelegate
extension PinCodeInputField: UITextFieldDelegate {
    private func setupTextField() {
        textField.delegate = self
    }
}

// MARK: - Dot
class Dot: UIView {
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
        layer.borderColor = .none
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
    private func configure() {
        heightAnchor.constraint(equalToConstant: 10).isActive = true
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        backgroundColor = .gray
    }
}

// MARK: - Background
class Background: UIView {
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topAnchor),
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func layoutSubviews() {
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
        backgroundColor = .modalBackground
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        gradientLayer.colors = [UIColor.modalBackground.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: gradientLayer.bounds, cornerRadius: frame.height / 2).cgPath
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        gradientLayer.mask = shapeLayer
        layer.addSublayer(gradientLayer)
    }
}
