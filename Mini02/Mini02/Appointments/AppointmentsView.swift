//
//  AppointmentsView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit
 
class AppointmentsView: UIView {
    
    // everything that is UI
  
    func setUpAppointmentsView(vc: AppointmentsViewController){
        
        
        vc.view.backgroundColor = .white
    }
    
    func justARandomButton(vc : AppointmentsViewController, action: Selector){
        
        let button = UIButton()
        
        button.setTitle("Consulta 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        
        button.addTarget(AppointmentsViewController(), action: action, for: .touchUpInside)
        
        vc.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor),
            button.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        
    }
    
}
