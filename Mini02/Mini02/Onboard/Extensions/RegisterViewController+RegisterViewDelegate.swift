//
//  RegisterViewController+RegisterViewDelegate.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation
import UIKit

extension RegisterViewController: RegisterViewDelegate {
    func nextButtonTapped() {
        
        let tabBarViewController = TabBarViewController()
//        tabBarViewController.modalPresentationStyle = .fullScreen
//        self.isModalInPresentation = false
//        self.present(tabBarViewController, animated: true)
     
        
        
        ApplicationSettings.hideOnboardingOnStart()
//       (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc: TabBarViewController())
    }
}
