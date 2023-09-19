//
//  AppointmentListView.swift
//  Mini02
//
//  Created by Daniel Ishida on 18/09/23.
//

import UIKit

class AppointmentListView: UITableView {
    func setUpListView(vc: AppointementsListVC){
        vc.view.backgroundColor = .white
    }
    
    //MARK: setup list function
    func setupList(vc:AppointementsListVC){
        //UI SETUP
        self.backgroundColor = .systemBackground
        
        //SET THE IDENTIFIER FOR CREATING NEW CELLS ON THIS LIST
        self.register(AppointmentListCell.self, forCellReuseIdentifier: AppointmentListCell.identifier)
        
        
        //ADD VIEW TO VIEW CONTROLLER
        vc.view.addSubview(self)
        
        //CONSTRAINTS SET UP
        self.anchorWithContantValues(
            top:vc.view.topAnchor,
            left: vc.view.leadingAnchor,
            right: vc.view.trailingAnchor,
            bottom: vc.view.bottomAnchor
        )
        
        //ASSIGN A DELEGATE AND DATA SOURCE OF LIST
        self.delegate = vc
        self.dataSource = vc
        
   
    }
    
    
    

}
