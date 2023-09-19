//
//  RegisterViewController+RegisterViewDelegate.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation

extension RegisterViewController: RegisterViewDelegate {
    func nextButtonTapped() {
        ApplicationSettings.hideOnboardingOnStart()
        let tabBarViewController = TabBarViewController()
        tabBarViewController.modalPresentationStyle = .fullScreen
        self.present(tabBarViewController, animated: true)
    }
}
