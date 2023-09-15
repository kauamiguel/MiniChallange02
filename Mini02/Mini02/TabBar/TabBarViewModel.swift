//
//  TabBarVM.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import Foundation
import UIKit


class TabBarViewModel: UIControl {   // everything that is logic
    func setUpTabBarViewModel(tb: TabBarViewController){
       
        let rootViewController1 = UINavigationController(rootViewController: AppointmentsViewController())
        let rootViewController2 = UINavigationController(rootViewController: RecurrentDataViewController())
        let rootViewController3 = UINavigationController(rootViewController: ProfileViewController())
        
        rootViewController1.tabBarItem.title = "Appointments"
        rootViewController1.tabBarItem.image = UIImage(systemName: "doc")
        
        rootViewController2.tabBarItem.title = "Data"
        rootViewController2.tabBarItem.image = UIImage(systemName: "dice")
        
        rootViewController3.tabBarItem.title = "Profile"
        rootViewController3.tabBarItem.image = UIImage(systemName: "person")
        
        tb.setViewControllers([rootViewController1, rootViewController2, rootViewController3], animated: true)
    }
}
