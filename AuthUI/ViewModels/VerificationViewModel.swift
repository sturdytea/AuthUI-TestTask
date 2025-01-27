//
//
// VerificationViewModel.swift
// AuthUI
//
// Created by sturdytea on 24.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class VerificationViewModel: ViewModel {
    var coordinator: AppCoordinator?
    
    private let accessCode = Bundle.main.infoDictionary?["ACCESS_CODE"] as? String
    var approved: Bool = false
    
    func checkCode(code: String) {
        if code == accessCode {
            print("Phone number verification: Successful")
            approved = true
            navigateToPinCodeInput()
        }
    }
    
    func navigateToPinCodeInput() {
        coordinator?.goToPinCodeInputPage()
    }
    
    func navigateToNoCodeRecieved() {
        coordinator?.goToNoCodePage()
    }
    
    func navigateBack() {
        coordinator?.goBack()
    }
}
