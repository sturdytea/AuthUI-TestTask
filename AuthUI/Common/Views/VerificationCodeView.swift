//
//
// VerificationCodeView.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class VerificationCodeView: UIView {
    var parentView: VerificationView?
    
    private var codeTextFields: [CodeTextField] = []
    
    private lazy var fieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getCodeInput() -> String {
        var code = ""
        codeTextFields.forEach {
            code.append($0.text ?? "")
        }
        return code
    }
    
    private func setupView() {
        for i in 0...5 {
            let textField = CodeTextField()
            textField.tag = i
            textField.cellDelegate = self
            codeTextFields.append(textField)
            fieldStackView.addArrangedSubview(textField)
        }
        codeTextFields[0].becomeFirstResponder()
        
        addSubview(fieldStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            fieldStackView.topAnchor.constraint(equalTo: topAnchor),
            fieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fieldStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - CodeTextFieldProtocol
extension VerificationCodeView: CodeTextFieldProtocol {
    func activateNextCell(tag: Int) {
        if tag != codeTextFields.count - 1 {
            codeTextFields[tag + 1].becomeFirstResponder()
            parentView?.loginButton.isEnabled = false
        } else {
            parentView?.loginButton.isEnabled = true
        }
    }
    
    func activatePreviousCell(tag: Int) {
        if tag != 0 {
            codeTextFields[tag - 1].text = ""
            codeTextFields[tag - 1].becomeFirstResponder()
        }
    }
    
    
}
