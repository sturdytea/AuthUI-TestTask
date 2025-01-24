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
    
    override func loadView() {
        view = phoneNumberInputView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
