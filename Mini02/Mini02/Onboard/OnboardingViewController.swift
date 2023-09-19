//
//  OnboardingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    
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
        let register = RegisterViewController()
        
        self.pages.append(first)
        self.pages.append(second)
        self.pages.append(third)
        self.pages.append(register)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = .black
        self.pageControl.pageIndicatorTintColor = .lightGray
        self.pageControl.currentPage = initialPage
        self.view.addSubview(self.pageControl)
        self.view.bringSubviewToFront(self.pageControl)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5),
            self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20),
            self.pageControl.heightAnchor.constraint(equalToConstant: 20),
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.pages.last
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
                if viewControllerIndex < self.pages.count - 1 {
                    // go to next page in array
                    return self.pages[viewControllerIndex + 1]
                }
        }
            return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewControllers = pageViewController.viewControllers {
                if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                    self.pageControl.currentPage = viewControllerIndex
                }
            }
    }
}
