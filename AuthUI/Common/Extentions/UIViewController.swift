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
        let alertController = UIAlertController(title: "Error", message: "Access code is 777777", preferredStyle: .alert)
        let approveAlertAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(approveAlertAction)
        present(alertController, animated: true)
    }
    
    func showPinCodeInputSuccessAlert() {
        let alertController = UIAlertController(title: "", message: "Вы успешно создали код приложения", preferredStyle: .alert)
        let continueAlertAction = UIAlertAction(title: "Войти в приложние", style: .default)
        
        alertController.addAction(continueAlertAction)
        present(alertController, animated: true)
    }
}
