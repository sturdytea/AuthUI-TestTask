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
        label.numberOfLines = 1
        label.font = .verificationTitleFont
        label.text = "Верификация"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var instruction: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .verificationInstructionFont
        label.text = "Введите код из смс,\nчто мы отправили вам"
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .timerFont
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var verificationCodeView: VerificationCodeView = {
        let view = VerificationCodeView()
        view.parentView = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var loginButton: UIButton = {
        let button = PrimaryActionButton()
        button.isEnabled = false
        button.setTitle("Зарегестрироваться", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var noCodeButton: UIButton = {
        let button = CustomPlainButton("Я не получил код!")
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
        addSubview(timerLabel)
        addSubview(verificationCodeView)
        addSubview(loginButton)
        addSubview(noCodeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            
            instruction.centerXAnchor.constraint(equalTo: centerXAnchor),
            instruction.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 32),
            
            verificationCodeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            verificationCodeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            verificationCodeView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 32),
            verificationCodeView.heightAnchor.constraint(equalToConstant: 46),
            
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: verificationCodeView.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            noCodeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            noCodeButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 32)
            
        ])
    }
}
