//
//  ListViewController.swift
//  Mini02
//
//  Created by Daniel Ishida on 20/09/23.
//

import UIKit

class ListViewController: UIViewController {
    var ListViewManager: ListView?
    var AppoimentListViewModelManager:AppointmentsListVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let view = ListViewManager else {
            fatalError("no view was passed")
        }
        
        view.controller = self
        view.setupView(action: #selector(GoToNextScene))
    }
    
    @objc func GoToNextScene(){
        AppoimentListViewModelManager?.AddAppointment()
    }
}
