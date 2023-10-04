//
//  OnboardingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let first = FirstOnboardingViewController()
        let second = SecondOnboardingViewController()
        let third = ThirdOnboardingViewController()
        let registerVc = UINavigationController(rootViewController: RegisterViewController())
        registerVc.isNavigationBarHidden = true
        let register = registerVc
        
        self.pages.append(first)
        self.pages.append(second)
        self.pages.append(third)
        self.pages.append(register)
        
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex > 0 {
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
                if viewControllerIndex < self.pages.count - 1 {
                    return self.pages[viewControllerIndex + 1]
                }
        }
            return nil
    }
    
}
