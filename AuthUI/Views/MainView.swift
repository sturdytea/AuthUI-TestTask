//
//
// MainView.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class MainView: UIView {
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .regular)
        label.text = "SIS"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var slogan: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Выбери свою безопасность"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let button = PrimaryActionButton()
        button.isEnabled = true 
        button.setTitle("Войти по номеру телефона", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var newUserHint: UILabel = {
        let label = UILabel()
        label.font = .urbanistMediumFont(ofSize: 14)
        label.text = "У вас нет аккаунта?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = CustomPlainButton("Зарегистрируйтесь сейчас")
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
        addSubview(logo)
        addSubview(title)
        addSubview(slogan)
        addSubview(loginButton)
        addSubview(newUserHint)
        addSubview(registerButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 80),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.topAnchor.constraint(equalTo:  topAnchor, constant: 265),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 32),
            
            slogan.centerXAnchor.constraint(equalTo: centerXAnchor),
            slogan.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: slogan.bottomAnchor, constant: 96),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            newUserHint.centerXAnchor.constraint(equalTo: centerXAnchor),
            newUserHint.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 96),
            
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: newUserHint.bottomAnchor, constant: 16)
        ])
    }
}
