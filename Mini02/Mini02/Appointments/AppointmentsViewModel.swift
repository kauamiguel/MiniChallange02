//
//  AppointmentsViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class AppointmentsViewModel: UIControl {
    

    
    func buttonAction(vc: AppointmentsViewController){
       vc.navigationController?.pushViewController(MaternityCardViewController(), animated: true)
    }
}
