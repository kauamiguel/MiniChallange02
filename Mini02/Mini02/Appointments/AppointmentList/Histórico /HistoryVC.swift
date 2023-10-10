//
//  HistoryVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 28/09/23.
//

import UIKit

class HistoryVC: UIViewController {
    
    //Variable with the info of the current consult
    var appointmentsInfo: ConsultEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = HistoryView()
        let dateFormatter = DateFormatter()
        
        //Add backButton in naviagtionItem
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "ChevronBackButton"), for: .normal)
        backButton.addTarget(self, action: #selector(backToView), for: .touchUpInside)
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
        
        
        newView.controller = self
        dateFormatter.dateFormat = "dd/MM/yy"
        
        if let date = appointmentsInfo?.date{
            newView.dateLabel.text = dateFormatter.string(from: date)
        }
        
        newView.titleLabel.text = "Informacoes da consulta \(appointmentsInfo!.consultId)"
        
        newView.setupView()
        
    }
    
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
}
