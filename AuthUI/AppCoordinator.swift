//
//
// AppCoordinator.swift
// AuthUI
//
// Created by sturdytea on 23.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        print("App Coordinator Start")
        goToMainPage()
    }
    
    func goToMainPage() {
        let viewController = MainViewController()
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        print("  > Main Screen")
    }
    
    func goToLoginPage() {
        let viewController = PhoneNumberInputViewController()
        let viewModel = PhoneNumberInputViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        print("  >> Login Screen")
    }
    
    func goToRegistrationPage() {
        let viewController = PhoneNumberInputViewController()
        let viewModel = PhoneNumberInputViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        print("  >> Registration Screen")
    }
}
