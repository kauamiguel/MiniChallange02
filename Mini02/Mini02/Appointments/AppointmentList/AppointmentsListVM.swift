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
    
    func AddAppointment(){
        view.navigationController?.pushViewController(MaternityCardViewController(), animated: true)
    }
    
    init(view: UIViewController) {
        self.view = view
    }

    
}
