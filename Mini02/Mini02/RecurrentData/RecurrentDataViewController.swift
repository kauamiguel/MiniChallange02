//
//  currentDataViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class RecurrentDataViewController: UIViewController {
    
    var recurrentView : RecurrentDataView = RecurrentDataView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recurrentView.setupView(vc: self)
        
    }

}
