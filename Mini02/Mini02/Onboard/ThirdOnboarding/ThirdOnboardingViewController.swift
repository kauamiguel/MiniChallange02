//
//  ThirdOnboadingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class ThirdOnboardingViewController: UIViewController {
    weak var pageController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thirdOnboardingView = ThirdOnboardingView()
        thirdOnboardingView.setupThirdOnboardingView(viewController: self)
    }
    
    @objc func didTapNext() {
        let register = UINavigationController(rootViewController: RegisterViewController())
        register.isNavigationBarHidden = true
        switchRootViewController(rootViewController: register, animated: true, completion: nil)
    }
    
    private func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window else {
              return
            }

        if animated {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window.rootViewController = rootViewController
        }
    }
}

