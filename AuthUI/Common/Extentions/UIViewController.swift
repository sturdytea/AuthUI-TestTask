//
//
// UIViewController.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

extension UIViewController {
    func showAlert() {
        let alertViewController = CustomAlertViewController()
        alertViewController.alertWindow.message.text = "Access code is 777777"
        alertViewController.alertWindow.button.setTitle("OK", for: .normal)
        alertViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        alertViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(alertViewController, animated: true)
    }
    
    func showPinCodeInputSuccessAlert() {
        let alertViewController = CustomAlertViewController()
        alertViewController.alertWindow.message.text = "Вы успешно создали код\nприложения"
        alertViewController.alertWindow.button.setTitle("Войти в приложние", for: .normal)
        alertViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        alertViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(alertViewController, animated: true)
    }
}
