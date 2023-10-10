//
//  HistoryVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 28/09/23.
//

import UIKit

class HistoryViewController: UIViewController {
    
    //Variable with the info of the current consult
    var appointmentsInfo: ConsultEntity?
    
    let testview: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
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
        
        testview.anchorWithConstantValues(top: self.view.topAnchor, width: 200, height: 200)
     
    }
}
