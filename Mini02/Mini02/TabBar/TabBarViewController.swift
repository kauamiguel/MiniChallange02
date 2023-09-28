//
//  TabBarViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    let tbViewManager = TabBarView()
    let core = CoreDataFunctions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbViewManager.setUpTabBarView(tb: self)
        setUpTabBarViewModel()
    }
    
   private func setUpTabBarViewModel(){
       
        let appointmentsViewController = AppointmentsViewController()
        let appointmentsViewModel = AppointmentsVM()
        let appointmentsView = AppointmentsView()

        appointmentsViewModel.view = appointmentsViewController
        appointmentsViewController.appointmentViewModelManager = appointmentsViewModel
        appointmentsViewController.appointmentViewManager = appointmentsView
        
        
        let rootViewController1 = UINavigationController(rootViewController: appointmentsViewController)
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
