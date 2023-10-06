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
        self.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
        self.layer.zPosition = 1
        self.layer.cornerRadius = 10
        self.superview?.isUserInteractionEnabled = true
        
        tableBarView.delegate = self
        tableBarView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview(){
        guard superview != nil else { return }
        self.superview?.superview?.addSubview(tableBarView)
        self.bringSubviewToFront(tableBarView)
        tableBarView.anchorWithConstantValues(top: self.bottomAnchor)
        tableBarView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableBarView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = tableBarView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for subview in self.superview!.subviews {
            if subview != self && subview != tableBarView {
                subview.isUserInteractionEnabled = false
            }
        }
        
        if !isOpen{
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.tableBarView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.tableBarView.tableView.contentSize.height
            }
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.67, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.tableBarView.layoutIfNeeded()
                self.tableBarView.center.y += self.tableBarView.frame.height / 2
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.tableBarView.center.y -= self.tableBarView.frame.height / 2
                self.tableBarView.layoutIfNeeded()
                self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
                
            }, completion: { _ in
                for subview in self.superview!.subviews {
                    subview.isUserInteractionEnabled = true
                }
            })
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.tableBarView.center.y -= self.tableBarView.frame.height / 2
            self.tableBarView.layoutIfNeeded()
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        }, completion: nil)
        for subview in self.superview!.subviews {
            subview.isUserInteractionEnabled = true
        }
    }
    
    
    
    func selectedOption(options string: String){
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
        
        self.selectedOption = string
    }
    
    
}



