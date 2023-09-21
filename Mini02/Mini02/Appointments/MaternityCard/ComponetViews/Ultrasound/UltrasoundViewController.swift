//
//  UltrasoundViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 20/09/23.
//

import UIKit

class UltrasoundViewController: UIViewController {
    lazy var manager = UltrasoundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.setUpView()
    }
}
