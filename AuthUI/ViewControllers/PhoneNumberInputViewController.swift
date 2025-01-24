//
//
// PhoneNumberInputViewController.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class PhoneNumberInputViewController: UIViewController {
    
    private lazy var phoneNumberInputView = PhoneNumberInputView()
    var viewModel: PhoneNumberInputViewModel?
    var navigationBarTitleText: String?
    
    override func loadView() {
        view = phoneNumberInputView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryCodePicker()
        setupTextField()
        setupNavigationBar(navigationBarTitleText ?? "")
        phoneNumberInputView.button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        phoneNumberInputView.phoneNumberTextField.becomeFirstResponder()
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
    private func submitButtonTapped() {
        viewModel?.navigateToVerification()
        viewModel?.phoneNumber = "\(String(describing: phoneNumberInputView.countryCodeTextField.text))\(String(describing: phoneNumberInputView.phoneNumberTextField.text))"
    }
    
    @objc
    private func backButtonTapped() {
        viewModel?.navigateBack()
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension PhoneNumberInputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    private func setupCountryCodePicker() {
        phoneNumberInputView.countryCodePicker.delegate = self
        phoneNumberInputView.countryCodePicker.dataSource = self
        phoneNumberInputView.countryCodeTextField.text = CountryCode.allCases[3].rawValue
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CountryCode.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let countryCode = CountryCode.allCases[row]
        return "\(countryCode.name) \(countryCode.rawValue)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected: CountryCode = CountryCode.allCases[row]
        phoneNumberInputView.countryCodeTextField.text = selected.rawValue
    }
}

// MARK: - UITextFieldDelegate
extension PhoneNumberInputViewController: UITextFieldDelegate {
    private func setupTextField() {
        phoneNumberInputView.phoneNumberTextField.delegate = self
        phoneNumberInputView.button.isEnabled = false
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string).count
    
        if text >= 9 || text.words.isEmpty {
            phoneNumberInputView.button.isEnabled = true
        } else {
            phoneNumberInputView.button.isEnabled = false
        }
        
        return true
    }
}
