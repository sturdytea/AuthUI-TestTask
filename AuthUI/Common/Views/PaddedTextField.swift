//
//
// PaddedTextField.swift
// AuthUI
//
// Created by sturdytea on 24.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PaddedTextField: UITextField {
    var textPaddings = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPaddings)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPaddings)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPaddings)
    }
}
