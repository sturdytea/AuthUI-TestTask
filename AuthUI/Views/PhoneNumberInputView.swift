//
//
// PhoneNumberInputView.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PhoneNumberInputView: UIView {
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .textFieldHintFont
        label.text = "Номер телефона"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var countryCodePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .black
        return picker
    }()
    
    private(set) lazy var countryCodeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .none
        textField.textColor = .white
        textField.textAlignment = .center
        textField.font = .textFieldInputFont
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 70, height: 50)
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
        textField.layer.addSublayer(gradientLayer)
        
        textField.inputView = countryCodePicker
        return textField
    }()
    
    
    lazy var phoneNumberTextField: UITextField = {
        let textField = PaddedTextField()
        textField.backgroundColor = .none
        textField.borderStyle = .line
        textField.keyboardType = .numberPad
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.textAlignment = .left
        textField.textColor = .white
        textField.font = .textFieldInputFont
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 150, height: 50)
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
        textField.layer.addSublayer(gradientLayer)
        return textField
    }()
    
    private lazy var hint: UILabel = {
        let label = UILabel()
        label.font = .hintFont
        label.text = "Код придет на ваш номер телефона"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var button: UIButton = {
        let button = PrimaryActionButton()
        button.setTitle("Получить код", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Keyboard toolbar
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [flexSpace, flexSpace, doneButton]
        toolbar.sizeToFit()
        phoneNumberTextField.inputAccessoryView = toolbar
        return toolbar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func dismissKeyboard() {
        self.endEditing(true)
    }
    
    private func setupView() {
        addSubview(title)
        addSubview(countryCodeTextField)
        addSubview(phoneNumberTextField)
        addSubview(hint)
        addSubview(button)
        addSubview(toolbar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            
            countryCodeTextField.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            countryCodeTextField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            countryCodeTextField.heightAnchor.constraint(equalToConstant: 50),
            countryCodeTextField.widthAnchor.constraint(equalToConstant: 70),
            
            phoneNumberTextField.leadingAnchor.constraint(equalTo: countryCodeTextField.trailingAnchor, constant: 16),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            phoneNumberTextField.topAnchor.constraint(equalTo: countryCodeTextField.topAnchor),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            hint.centerXAnchor.constraint(equalTo: centerXAnchor),
            hint.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 32),
            
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: hint.bottomAnchor, constant: 48),
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
        ])
    }
}
