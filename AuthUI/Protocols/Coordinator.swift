//
//
// Coordinator.swift
// AuthUI
//
// Created by sturdytea on 24.01.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
