//
//  ListViewController.swift
//  Mini02
//
//  Created by Daniel Ishida on 20/09/23.
//

import UIKit

class ListViewController: UIViewController {
    var listViewManager: ListView?
    var appoimentListViewModelManager:AppointmentsListVM?
    
    override func viewWillAppear(_ animated: Bool) {
        appoimentListViewModelManager?.updateConsultsOfThisTreemester()
        if let list = self.listViewManager, let viewModelManager = appoimentListViewModelManager{
            list.setupView(action: #selector(GoToNextScene), viewModel: viewModelManager)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a custom UIButton
        let customButton = UIButton(type: .custom)

        // Set the image for the button
        let image = UIImage(named: "ChevronBackButton")
  
        customButton.setImage(image, for: .normal)
        

        // Set the title for the button
        customButton.setTitle("  Trimestres", for: .normal)
        customButton.setTitleColor(UIColor.darkPink(), for: .normal) // Adjust text color as needed
        // Get the preferred body font
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)

        // Calculate the scaled font size
        let scaledFontSize = bodyFont.pointSize * 0.9

        let signikaBoldFont = UIFont(name: "Signika-Bold", size: scaledFontSize)

        // Set the scaled font for the title
        customButton.titleLabel?.font = signikaBoldFont
        
        // Set the action for the button
        customButton.addTarget(self, action: #selector(backToView), for: .touchUpInside)

        // Adjust the size of the button to fit its content
        customButton.sizeToFit()

        // Create a UIBarButtonItem with the custom UIButton as the custom view
        let customBarButtonItem = UIBarButtonItem(customView: customButton)

        // Set the custom UIBarButtonItem as the back button for the navigation item
        navigationItem.leftBarButtonItem = customBarButtonItem
       
        guard let view = listViewManager else {
            fatalError("no view was passed")
        }
                
        view.controller = self
    }
    
    //Function of the backButton
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func GoToNextScene(){
        appoimentListViewModelManager?.AddAppointment()
    }
    
}
