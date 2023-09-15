//
//  TabBarViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    let tbViewManager = TabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbViewManager.setUpTabBarView(tb: self)
        setUpTabBarViewModel()
    }
    
    func setUpTabBarViewModel(){
       
        let rootViewController1 = UINavigationController(rootViewController: AppointmentsViewController())
        let rootViewController2 = UINavigationController(rootViewController: RecurrentDataViewController())
        let rootViewController3 = UINavigationController(rootViewController: ProfileViewController())
        
        rootViewController1.tabBarItem.title = "Appointments"
        rootViewController1.tabBarItem.image = UIImage(systemName: "doc")
        
        rootViewController2.tabBarItem.title = "Data"
        rootViewController2.tabBarItem.image = UIImage(systemName: "dice")
        
        rootViewController3.tabBarItem.title = "Profile"
        rootViewController3.tabBarItem.image = UIImage(systemName: "person")
        
        self.setViewControllers([rootViewController1, rootViewController2, rootViewController3], animated: true)
    }

}
