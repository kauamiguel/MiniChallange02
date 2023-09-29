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
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(backToView))
        
       
        guard let view = ListViewManager else {
            fatalError("no view was passed")
        }
        
        view.controller = self
        view.setupView(action: #selector(GoToNextScene))
    }
    
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func GoToNextScene(){
        AppoimentListViewModelManager?.AddAppointment()
    }
}
