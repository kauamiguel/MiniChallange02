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
        
        // Create a custom UIButton with an image
            let backButton = UIButton(type: .custom)
            backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            backButton.tintColor = UIColor(red: 1, green: 0.521, blue: 0.58, alpha: 1)
            backButton.addTarget(self, action: #selector(backToView), for: .touchUpInside)
            
            // Create a UIBarButtonItem with the custom UIButton as the custom view
            let customBackButton = UIBarButtonItem(customView: backButton)
            
            // Set the custom UIBarButtonItem as the back button for the navigation item
            navigationItem.leftBarButtonItem = customBackButton
       
        guard let view = ListViewManager else {
            fatalError("no view was passed")
        }
        
        view.controller = self
        view.setupView(action: #selector(GoToNextScene))
    }
    
    //Function of the backButton
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func GoToNextScene(){
        AppoimentListViewModelManager?.AddAppointment()
    }
}
