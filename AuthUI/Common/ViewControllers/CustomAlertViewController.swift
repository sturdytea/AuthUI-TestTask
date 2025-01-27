//
//
// CustomAlertViewController.swift
// AuthUI
//
// Created by sturdytea on 27.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class CustomAlertViewController: UIViewController {
    
    private(set) lazy var alertWindow = CustomAlert()
    
    override func loadView() {
        view = alertWindow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertWindow.button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc private func actionButtonTapped() {
        dismiss(animated: true)
    }
}
