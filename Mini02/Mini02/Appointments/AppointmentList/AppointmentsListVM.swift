//
//  AppointmentsListVM.swift
//  Mini02
//
//  Created by Daniel Ishida on 21/09/23.
//

import Foundation
import UIKit

class AppointmentsListVM{
    var view: UIViewController
    var consults : [ConsultEntity]?
    var coreDataManager = CoreDataFunctions()
    //Value to know wich treemester, then the MaternityCard can Assign this atribute to the new Consult
    var treemester : Int?
    
    //Add appointment and assign the treemester number
    func AddAppointment(){
        if let numberTreemester = treemester{
            view.navigationController?.pushViewController(MaternityCardViewController(treemester: numberTreemester), animated: true)
        }
    }
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func updateConsultsOfThisTreemester(){
        let allConsults = coreDataManager.getConsults()
        var consultUpdated = [ConsultEntity]()
        
        //Get the consults just relationaded of this semester
        guard let treemesterNumber = treemester else{return}
        for consult in allConsults{
            if consult.tremesteer == treemesterNumber{
                consultUpdated.append(consult)
            }
        }
        self.consults = consultUpdated
    }
}
