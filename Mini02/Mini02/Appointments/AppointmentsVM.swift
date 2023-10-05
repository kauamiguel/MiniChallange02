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
    var coreDataManager = CoreDataFunctions()
    
    func buttonFuncionality(treemesterNumber : Int){
        let allConsults = coreDataManager.getConsults()
        var consultsOfThisSemester = [ConsultEntity]()
        
        //Get the consults just relationaded of this semester
        for consult in allConsults{
            if consult.tremesteer == treemesterNumber{
                consultsOfThisSemester.append(consult)
            }
        }

        let listController = ListViewController()
        //Assign the consult of this semester to the listViewController
        listController.AppoimentListViewModelManager = AppointmentsListVM(view: listController)
        listController.AppoimentListViewModelManager?.consults = consultsOfThisSemester
        listController.AppoimentListViewModelManager?.treemester = treemesterNumber
        //Create a listView and assign to his tableViewController the viewModel wiht the Consults
        listController.ListViewManager = ListView()
        listController.ListViewManager?.tableController.appointmentVM = listController.AppoimentListViewModelManager
        view?.navigationController?.pushViewController(listController, animated: true)
    }
}
