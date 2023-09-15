//
//  HomeViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class AppointmentsViewController: UIViewController {

    let appointmentViewManager = AppointmentsView()
    let appointmentVmManager = AppointmentsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appointmentViewManager.setUpAppointmentsView(vc: self)
        appointmentViewManager.justARandomButton(vc: self, action: #selector(test))
    }
    
   @objc func test(){ //need validation
        appointmentVmManager.buttonAction(vc: self)
    }

}
