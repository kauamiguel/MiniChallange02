//
//  DropDownComponentView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 27/09/23.
//

import Foundation
import UIKit


class DropDownComponentView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    var setupDropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
        tableView.layer.zPosition = 1
        self.backgroundColor =  UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
        self.layer.zPosition = 1
        
        tableView.delegate = self
        tableView.dataSource = self
        self.layer.zPosition = 100
        
        tableView.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        
        tableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
       
        self.addSubview(tableView)
        
        tableView.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor, right: self.trailingAnchor, bottom: self.bottomAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setupDropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = setupDropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
        cell.selectionStyle = .default // ask Chris about this
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.selectedOption(options: setupDropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
