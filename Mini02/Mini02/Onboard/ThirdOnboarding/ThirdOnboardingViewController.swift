//
//  ThirdOnboadingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class ThirdOnboardingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thirdOnboardingView = ThirdOnboardingView()
        thirdOnboardingView.setupThirdOnboardingView(viewController: self)
    }
}
