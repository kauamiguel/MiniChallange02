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
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc: MaternityCardViewController())
    }
}
