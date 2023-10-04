//
//  AppointmentsVM.swift
//  Mini02
//
//  Created by Gabriel Eirado on 22/09/23.
//

import Foundation
import UIKit

class AppointmentsVM {
    
    var view: UIViewController?
    
    @objc func didTapFirstSemester() {
        if ApplicationSettings.shouldEnterFirstAppointment() {
            view?.navigationController?.pushViewController(MaternityCardViewController(), animated: true)
        } else {
            let listController = ListViewController()
            listController.ListViewManager = ListView()
            listController.AppoimentListViewModelManager = AppointmentsListVM(view: listController)

            view?.navigationController?.pushViewController(listController, animated: true)
        }
    }
    
    @objc func didTapSecondSemester() {
        didTapFirstSemester() // this is temporary, delete when implementing actual functionality
    }
    
    @objc func didTapThirdSemester() {
        didTapFirstSemester() // this is temporary, delete when implementing actual functionality
    }
}
