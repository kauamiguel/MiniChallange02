//
//  AppointmentsVM.swift
//  Mini02
//
//  Created by Gabriel Eirado on 15/09/23.
//

import Foundation
import UIKit

class AppointmentsVM {
    
    var view: UIViewController?
    
    func buttonFuncionality(){
        let listController = ListViewController()
        

        listController.listViewManager = ListView()
        listController.AppoimentListViewModelManager = AppointmentsListVM(view: listController)


        view?.navigationController?.pushViewController(listController, animated: true)
    }
}
