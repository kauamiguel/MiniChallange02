//
//  TabBarViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    let tbViewManager = TabBarView()
    let tbVmManager = TabBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbViewManager.setUpTabBarView(tb: self)
        tbVmManager.setUpTabBarViewModel(tb: self)
    }
}
