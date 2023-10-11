//
//  TabBarViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    let tbViewManager = TabBarView()
    let coreDataManager = CoreDataFunctions()
    let HEIGHT_TAB_BAR:CGFloat = UIScreen.main.bounds.height * 0.11

    override func viewDidLoad() {
        super.viewDidLoad()
        tbViewManager.setUpTabBarView(tb: self)
        coreDataManager.fetchPacient()
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
        let rootViewController3 = UINavigationController(rootViewController: PregnantDataViewController())
        
        rootViewController1.tabBarItem.title = "Consultas"
        rootViewController1.tabBarItem.image = UIImage(systemName: "doc")
       
        
        rootViewController2.tabBarItem.title = "Dados recorrentes"
        rootViewController2.tabBarItem.image = UIImage(systemName: "dice")
       
       
        rootViewController3.tabBarItem.title = "Perfil"
        rootViewController3.tabBarItem.image = UIImage(systemName: "person")
        
       
       
       self.setViewControllers([rootViewController1, rootViewController2, rootViewController3], animated: true)
    }

}
