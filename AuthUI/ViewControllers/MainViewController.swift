//
//
// MainViewController.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModel?
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        mainView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonTapped() {
        viewModel?.navigateToLogin()
    }
    
    @objc
    private func registerButtonTapped() {
        viewModel?.navigateToRegister()
    }
}

