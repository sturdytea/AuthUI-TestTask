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
        viewController.navigationBarTitleText = "Войти"
        navigationController.pushViewController(viewController, animated: true)
        print("  >> Login Screen")
    }
    
    func goToRegistrationPage() {
        let viewController = PhoneNumberInputViewController()
        let viewModel = PhoneNumberInputViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        viewController.navigationBarTitleText = "Зарегистрироваться"
        navigationController.pushViewController(viewController, animated: true)
        print("  >> Registration Screen")
    }
    
    func goToVerificationPage() {
        let viewController = VerificationViewController()
        let viewModel = VerificationViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        print("    >>> Validation Screen")
    }
    
    func goToPinCodeInputPage() {
        let viewController = PinCodeInputViewController()
        let viewModel = PinCodeInputViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        print("        >>>>> Pin-code Input Screen")
    }
    
    func goToNoCodePage() {
        let viewController = NoCodeViewController()
        let viewModel = NoCodeViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        print("      >>>> No-code Screen")
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
        print("  < Back")
    }
}
