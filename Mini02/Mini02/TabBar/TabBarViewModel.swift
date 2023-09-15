//
//  TabBarVM.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import Foundation
import UIKit


class TabBarViewModel: UIControl{
    func setUpTabBarVM(tb: TabBarViewController){
       
        let rootViewController1 = UINavigationController(rootViewController: AppointmentsViewController())
        let rootViewController2 = UINavigationController(rootViewController: RecurrentDataViewController())
        
        rootViewController1.tabBarItem.title = "Home"
        rootViewController1.tabBarItem.image = UIImage(systemName: "house")
        
        rootViewController2.tabBarItem.title = "Data"
        rootViewController2.tabBarItem.image = UIImage(systemName: "dice")
        
        tb.setViewControllers([rootViewController1, rootViewController2], animated: true)
    }
}
