//
//  HistoryVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 28/09/23.
//

import UIKit

class HistoryVC: UIViewController {
    var appointmentsInfo: consulta?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = HistoryView()
        let dateFormatter = DateFormatter()
        
        newView.controller = self
        dateFormatter.dateFormat = "dd/MM/yy"
        newView.dateLabel.text = dateFormatter.string(from: appointmentsInfo!.data)
        newView.titleLabel.text = appointmentsInfo?.numero
        newView.setupView()
        
        // Do any additional setup after loading the view.
     
    }
    

}
