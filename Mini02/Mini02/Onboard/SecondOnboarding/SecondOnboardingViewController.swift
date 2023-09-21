//
//  SecondOnboardingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit


class SecondOnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondOnboardingView = SecondOnboardingView()
        secondOnboardingView.setupSecondOnboarding(viewController: self)
    }
}

