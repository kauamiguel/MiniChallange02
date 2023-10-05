//
//  HistoryVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 28/09/23.
//

import UIKit

class HistoryVC: UIViewController {
    var appointmentsInfo: ConsultEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = HistoryView()
        let dateFormatter = DateFormatter()
        
        newView.controller = self
        dateFormatter.dateFormat = "dd/MM/yy"
        if let date = appointmentsInfo?.date{
            newView.dateLabel.text = dateFormatter.string(from: date)
        }
        
        newView.titleLabel.text = "Informacoes da consulta \(appointmentsInfo!.consultId)"
        
        newView.setupView()
        
        // Do any additional setup after loading the view.
     
    }
}
