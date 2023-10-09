//
//  OnboardingViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    var pages = [UIViewController]()
    public let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let first = FirstOnboardingViewController()
        first.pageController = self
        let second = SecondOnboardingViewController()
        second.pageController = self
        let third = ThirdOnboardingViewController()
        third.pageController = self
        
        
        
        self.pages.append(first)
        self.pages.append(second)
        self.pages.append(UINavigationController(rootViewController: third))
        
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageControl)
        pageControl.isUserInteractionEnabled = false
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 255/255, green: 133/255, blue: 148/255, alpha: 1)
        self.pageControl.pageIndicatorTintColor = UIColor(red: 255/255, green: 208/255, blue: 208/255, alpha: 1)
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = initialPage
        self.view.addSubview(self.pageControl)
        pageControl.centerX(inView: view)
        pageControl.anchorWithConstantValues(top: view.safeAreaLayoutGuide.topAnchor, topPadding: 60, width: UIScreen.main.bounds.width, height: 20)
   
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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                    self.pageControl.currentPage = viewControllerIndex
                }
            }
    }
    
    func goToNextPage() {
           guard let currentViewController = self.viewControllers?.first else { return }
           guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
           setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    
}
