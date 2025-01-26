//
//
// VerificationViewController.swift
// AuthUI
//
// Created by sturdytea on 24.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class VerificationViewController: UIViewController {
    
    private lazy var verificationView = VerificationView()
    var viewModel: VerificationViewModel?
    var timer = Timer()
    
    var time = 300 {
        didSet {
            let minutes = time / 60
            let seconds = time % 60
            verificationView.timerLabel.text = "Запросить код можно\nчерез \(String(format: "%02d:%02d", minutes, seconds))"
        }
    }
    
    override func loadView() {
        view = verificationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar("")
        verificationView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        verificationView.noCodeButton.addTarget(self, action: #selector(noCodeButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerClocks), userInfo: nil, repeats: true)
        }
    }
    
    private func setupNavigationBar(_ titleText: String) {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .white
        titleLabel.font = .navigationBarTitleFont
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.titleView = titleLabel
    }
    
    @objc
    private func loginButtonTapped() {
        let input = verificationView.verificationCodeView.getCodeInput()
        viewModel?.checkCode(code: input)
        if viewModel?.approved != true {
            showAlert()
        }
    }
    
    @objc
    private func noCodeButtonTapped() {
        viewModel?.navigateToNoCodeRecieved()
    }
    
    @objc
    private func timerClocks() {
        if time > 0 {
            time -= 1
        } else {
            timer.invalidate()
            verificationView.timerLabel.text = "Код можно запросить заново"
        }
   }
    
    @objc
    private func backButtonTapped() {
        viewModel?.navigateBack()
    }
}
