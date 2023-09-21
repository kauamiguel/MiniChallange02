//
//  DefaultViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 20/09/23.
//

import UIKit

class DefaultViewController: UIViewController {
    lazy var manager = DefaultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.setUpView()
    }


}
