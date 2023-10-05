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
    //Value to know wich treemester, then the MaternityCard can Assign this atribute to the new Consult
    var treemester : Int?
    
    func AddAppointment(){
        if let numberTreemester = treemester{
            view.navigationController?.pushViewController(MaternityCardViewController(treemester: numberTreemester), animated: true)
        }
        
    }
    
    init(view: UIViewController) {
        self.view = view
    }

    
}
