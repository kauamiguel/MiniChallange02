//
//  DropDownMenuComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 25/09/23.
//


import UIKit

protocol dropDownProtocol {
    func selectedOption(options : String)
}

class DropDownMenuComponent: UIButton, dropDownProtocol {
    
    var tableBarView = DropDownComponentView()
    var selectedOption: String?
    var height = NSLayoutConstraint()
    
    func setupButton(){
        self.backgroundColor = UIColor.darkGray
        
        tableBarView.delegate = self
        tableBarView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(tableBarView)
        self.superview?.bringSubviewToFront(tableBarView)
        tableBarView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableBarView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableBarView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = tableBarView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.tableBarView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.tableBarView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.tableBarView.layoutIfNeeded()
                self.tableBarView.center.y += self.tableBarView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.tableBarView.center.y -= self.tableBarView.frame.height / 2
                self.tableBarView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.tableBarView.center.y -= self.tableBarView.frame.height / 2
            self.tableBarView.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    func selectedOption(options string: String){
        self.setTitle(string, for: .normal)
        self.dismissDropDown()

        self.selectedOption = string
    }
    
    
}



