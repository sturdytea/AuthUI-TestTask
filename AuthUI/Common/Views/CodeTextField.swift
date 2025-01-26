//
//
// CodeTextField.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class CodeTextField: PaddedTextField {
    var cellDelegate: CodeTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        borderStyle = .line
        keyboardType = .numberPad
        layer.cornerRadius = 4
        layer.masksToBounds = true
        textAlignment = .center
        textColor = .white
        tintColor = .clear
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
        shapeLayer.path = UIBezierPath(roundedRect: gradientLayer.bounds, cornerRadius: 4).cgPath
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        gradientLayer.mask = shapeLayer
        layer.addSublayer(gradientLayer)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 46),
            widthAnchor.constraint(equalToConstant: 46),
        ])
    }
    
    override func deleteBackward() {
        cellDelegate?.activatePreviousCell(tag: tag)
    }
}

// MARK: - UITextFieldDelegate
extension CodeTextField: UITextFieldDelegate {
    
    private func setupTextField() {
        delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        text = string
        if range.length == 0 {
            cellDelegate?.activateNextCell(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.opacity = 0.7
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.opacity = 1
    }
}
