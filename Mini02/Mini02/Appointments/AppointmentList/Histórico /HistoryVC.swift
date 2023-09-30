//
//  HistoryVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 28/09/23.
//

import UIKit

class HistoryVC: UIViewController {
    let Dummyview = HistoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Dummyview.controller = self
        Dummyview.setupView()
        // Do any additional setup after loading the view.
     
    }
    

}
