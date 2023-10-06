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
        
        appointmentViewManager?.setupView(vc: self, firstTreemesterAction: #selector(firstTreemesterAction), secondTreemesterAction: #selector(secondTreemesterAction), thirdTreemesterAction: #selector(thirdTreemesterAction))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        appointmentViewManager?.drawDashedCurvedLineBetweenButtons(vc: self, isFirstTremesteer: true, isSecondTremester: true)
    }

    
    //Functions to communicate with list view to know wich semester are
    @objc func firstTreemesterAction(){
      appointmentViewModelManager?.buttonFuncionality(treemesterNumber: 1)
    }
    
    @objc func secondTreemesterAction(){
      appointmentViewModelManager?.buttonFuncionality(treemesterNumber: 2)
    }
    
    @objc func thirdTreemesterAction(){
      appointmentViewModelManager?.buttonFuncionality(treemesterNumber: 3)
    }

}

