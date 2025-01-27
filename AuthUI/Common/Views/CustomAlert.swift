//
//
// CustomAlert.swift
// AuthUI
//
// Created by sturdytea on 27.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class CustomAlert: UIView {
    
    private lazy var alertCard: UIView = {
        let view = UIView()
        view.backgroundColor = .modalBackground
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 28
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var alertButtonCard: UIView = {
        let view = UIView()
        view.backgroundColor = .modalBackground
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 28
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var  message: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var  button: UIButton = {
        let button = UIButton()
        button.isEnabled = true
//        button.titleLabel?.textColor = .blue
        button.tintColor = .blue
        button.titleLabel?.font = .poppinsMediumFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black.withAlphaComponent(0.4)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(alertCard)
        addSubview(alertButtonCard)
        alertCard.addSubview(message)
        alertButtonCard.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            alertCard.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            alertCard.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            alertCard.widthAnchor.constraint(equalToConstant: 328),
            alertCard.heightAnchor.constraint(equalToConstant: 112),
            
            alertButtonCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertButtonCard.topAnchor.constraint(equalTo: alertCard.bottomAnchor, constant: 32),
            alertButtonCard.widthAnchor.constraint(equalTo: alertCard.widthAnchor),
            alertButtonCard.heightAnchor.constraint(equalToConstant: 64),
            
            message.centerXAnchor.constraint(equalTo: alertCard.centerXAnchor),
            message.centerYAnchor.constraint(equalTo: alertCard.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: alertButtonCard.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: alertButtonCard.centerYAnchor)
        ])
    }
}
