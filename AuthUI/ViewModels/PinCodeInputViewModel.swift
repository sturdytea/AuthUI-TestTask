//
//
// PinCodeInputViewModel.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class PinCodeInputViewModel: ViewModel {
    var coordinator: AppCoordinator?
    
    func navigateToHome() {
//        coordinator?.goToHomePage()
    }
    
    func navigateBack() {
        coordinator?.goBack()
    }
}
