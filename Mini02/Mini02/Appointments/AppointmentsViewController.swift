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
        
        appointmentViewManager?.setupView(vc: self, action: #selector(buttonAction))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        appointmentViewManager?.drawDashedCurvedLineBetweenButtons(vc: self, isFirstTremesteer: true, isSecondTremester: true)
    }
    
  @objc func buttonAction(){
      appointmentViewModelManager?.buttonFuncionality()
    }
}

