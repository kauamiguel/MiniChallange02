//
//  ListViewController.swift
//  Mini02
//
//  Created by Daniel Ishida on 20/09/23.
//

import UIKit

class ListViewController: UIViewController {
    var listViewManager: ListView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let view = listViewManager else {
            fatalError("no view was passed")
        }
        
            view.controller = self
            view.setupView()
        
        // Do any additional setup after loading the view.
    }
}
