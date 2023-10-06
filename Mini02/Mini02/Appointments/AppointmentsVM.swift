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

    func isFirstTreemester() -> Bool{
        let allConsults = coreDataManager.getConsults()
        
        //Get the consults just relationaded of this semester
        for consult in allConsults{
            if consult.tremesteer == 2{
                return false
            }
        }
        return true
    }
    
    func buttonFuncionality(treemesterNumber : Int){
        
        //Chete wheter is first consult to push the firsConsult View
        if ApplicationSettings.shouldEnterFirstAppointment() {
            view?.navigationController?.pushViewController(MaternityCardViewController(treemester: 1), animated: true)
        }else{
            let allConsults = coreDataManager.getConsults()
            var consultsOfThisSemester = [ConsultEntity]()
            
            //Get the consults just relationaded of this semester
            for consult in allConsults{
                if consult.tremesteer == treemesterNumber{
                    consultsOfThisSemester.append(consult)
                }
            }
            
            let listController = ListViewController()
            listController.AppoimentListViewModelManager = AppointmentsListVM(view: listController)
            //Assign the consult of this semester to the listViewController
            listController.AppoimentListViewModelManager?.consults = consultsOfThisSemester
            listController.AppoimentListViewModelManager?.treemester = treemesterNumber
            //Create a listView and assign to his tableViewController the viewModel wiht the Consults
            listController.ListViewManager = ListView()
            listController.ListViewManager?.tableController.appointmentVM = listController.AppoimentListViewModelManager
            view?.navigationController?.pushViewController(listController, animated: true)
        }
    }
}
