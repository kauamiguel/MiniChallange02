//
//  BloodViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 20/09/23.
//

import UIKit

class BloodViewController: UIViewController {
    lazy var manager = BloodView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.setUpView()
        
    }
    

   

}
