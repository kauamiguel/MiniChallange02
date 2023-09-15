//
//  HomeViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class AppointmentsViewController: UIViewController {

    var appointmentViewModelManager: AppointmentsVM?
    var appointmentViewManager: AppointmentsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        appointmentViewManager?.setUpAppointmentsView(vc: self)
        appointmentViewManager?.justARandomButton(vc: self, action: #selector(buttonAction))
  
    }
    
  @objc func buttonAction(){
      appointmentViewModelManager?.buttonFuncionality()
    }
}
