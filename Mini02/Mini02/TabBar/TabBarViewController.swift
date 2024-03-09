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
        
        rootViewController1.tabBarItem.title = "Consultas".localized()
        rootViewController1.tabBarItem.image = UIImage(named: "0")
        rootViewController1.tabBarItem.selectedImage = UIImage(named: "Fill0")
        rootViewController1.accessibilityLabel = "ícone de consultas"
        
        rootViewController2.tabBarItem.title = "Dados recorrentes".localized()
        rootViewController2.tabBarItem.image = UIImage(systemName: "doc.text")
        rootViewController2.tabBarItem.selectedImage = UIImage(systemName: "doc.text.fill")
        rootViewController2.accessibilityLabel = "ícone de dados recorrentes"
        
       
       self.setViewControllers([rootViewController1, rootViewController2 ,  rootViewController3], animated: true)

        rootViewController3.tabBarItem.title = "Perfil".localized()
        rootViewController3.tabBarItem.image = UIImage(systemName: "person.circle")
        rootViewController3.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        rootViewController3.accessibilityLabel = "Dados da gestante"
        
        self.setViewControllers([rootViewController1, rootViewController2 , rootViewController3], animated: true)
    }
    
}
