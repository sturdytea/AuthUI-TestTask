//
//
// NoCodeView.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class NoCodeView: UIView {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .interMediumFont(ofSize: 24)
        label.text = "Не пришел код?"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var instruction: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .interRegularFont(ofSize: 16)
        label.text = "Не пришел код?\nОбратитесь в чат поддержку"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = PrimaryActionButton()
        button.isEnabled = true
        button.setTitle("OK", for: .normal)
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
        addSubview(actionButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            
            instruction.centerXAnchor.constraint(equalTo: centerXAnchor),
            instruction.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            actionButton.topAnchor.constraint(equalTo: instruction.bottomAnchor, constant: 168)
        ])
    }
}
