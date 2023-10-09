//
//  FirstOnboardingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class FirstOnboardingViewController: UIViewController {
    weak var pageController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstOnboardingView = FirstOnboardingView()
        firstOnboardingView.setupFirstOnboarding(viewController: self)
    }
}
