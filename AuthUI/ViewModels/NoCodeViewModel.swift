//
//
// NoCodeViewModel.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class NoCodeViewModel: ViewModel {
    var coordinator: AppCoordinator?
    
    func navigateBack() {
        coordinator?.goBack()
    }
}
