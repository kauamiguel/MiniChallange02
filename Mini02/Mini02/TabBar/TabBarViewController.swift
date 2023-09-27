//
//  TabBarViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let tbViewManager = TabBarView()
    let coreData = CoreDataFunctions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbViewManager.setUpTabBarView(tb: self)
        setUpTabBarViewModel()
        
    }
    
   private func setUpTabBarViewModel(){
       
       //Testes
       coreData.fetchPacient()
       coreData.addBloodExam(bloodExam: BloodExamModel(bloodType: .ABNegative, toxoplasmosis: .init(igm: true, igg: true), hiv: false, vdrl: .four, syphilis: false, tci: true, tcd: true, urea: UreaExam(mg: 10, dL: 15.2), creatine: 10.2, ht: 1.1, hb: 1.1, whiteCells: 1, platelets: 2, glucose: 3, hepatiteB: false))
       print(coreData.pacient.first?.bloodExam)
       
       
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
