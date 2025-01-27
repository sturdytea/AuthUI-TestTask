//
//
// PinCodeInputView.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PinCodeInputView: UIView {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        label.text = "Создайте код приложения"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var instruction: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.text = "Введите код из символов"
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var indicators: PinCodeInputField = {
        let inputField = PinCodeInputField()
        inputField.translatesAutoresizingMaskIntoConstraints = false
        return inputField
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = PrimaryActionButton()
        button.isEnabled = true
        button.setTitle("Пропустить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private func setupView() {
        addSubview(title)
        addSubview(instruction)
        addSubview(indicators)
        addSubview(actionButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            
            instruction.centerXAnchor.constraint(equalTo: centerXAnchor),
            instruction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            instruction.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 48),
            
            indicators.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicators.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            indicators.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 32),
            
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            actionButton.topAnchor.constraint(equalTo: indicators.bottomAnchor, constant: 88)
        ])
    }
}
