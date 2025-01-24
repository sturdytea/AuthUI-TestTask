//
//
// MainViewModel.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class MainViewModel {
    var coordinator: AppCoordinator?
    
    func navigateToLogin() {
        coordinator?.goToLoginPage()
    }
    
    func navigateToRegister() {
        coordinator?.goToRegistrationPage()
    }
}
