//
//
// PinCodeInputViewController.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PinCodeInputViewController: UIViewController {

    private lazy var pinCodeInputView = PinCodeInputView()
    var viewModel: PinCodeInputViewModel?
    
    override func loadView() {
        view = pinCodeInputView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar("Код приложения")
        pinCodeInputView.indicators.focusInput()
        pinCodeInputView.indicators.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        pinCodeInputView.actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
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
        titleLabel.font = .urbanistMediumFont(ofSize: 20)
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.titleView = titleLabel
    }
    
    @objc
    private func textDidChange() {
        let pinCodeLength = pinCodeInputView.indicators.pinCodeLength
        
        guard let text = pinCodeInputView.indicators.textField.text else { return }
        let filledCount = min(text.count, pinCodeLength)
        pinCodeInputView.indicators.updateDots(filledCount: filledCount)
        
        if filledCount == pinCodeLength {
            pinCodeInputView.indicators.textField.resignFirstResponder()
            pinCodeInputView.indicators.pinCodeComplete(pin: text)
            showPinCodeInputSuccessAlert()
        }
    }
    
    @objc
    private func actionButtonTapped() {
        viewModel?.navigateToHome()
    }
    
    @objc private func backButtonTapped() {
        viewModel?.navigateBack()
    }
}
