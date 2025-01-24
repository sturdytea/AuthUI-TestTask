//
//
// PhoneNumberInputViewModel.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class PhoneNumberInputViewModel: ViewModel {
    var coordinator: AppCoordinator?
    
    var phoneNumber: String = "" {
        didSet {
            validatePhoneNumber()
        }
    }
    
    var onButtonStateChange: ((Bool) -> Void)?
    
    func navigateBack() {
        coordinator?.goBack()
    }
    
    func navigateToVerification() {
        coordinator?.goToVerificationPage()
    }
    
    private func validatePhoneNumber() {
        let isValid = phoneNumber.filter { $0.isNumber }.count >= 9
        onButtonStateChange?(isValid)
    }
}
