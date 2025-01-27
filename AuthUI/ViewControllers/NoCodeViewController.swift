//
//
// NoCodeViewController.swift
// AuthUI
//
// Created by sturdytea on 26.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

class NoCodeViewController: UIViewController {
    
    private lazy var noCodeView = NoCodeView()
    var viewModel: NoCodeViewModel?
    
    override func loadView() {
        view = noCodeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar("")
        noCodeView.actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar(_ titleText: String) {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .white
        titleLabel.font = .urbanistMediumFont(ofSize: 20)
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.titleView = titleLabel
    }
    
    @objc
    private func buttonTapped() {
        viewModel?.navigateBack()
    }
}
