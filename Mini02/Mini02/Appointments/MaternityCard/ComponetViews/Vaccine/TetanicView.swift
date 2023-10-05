//
//  VaccineView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 04/10/23.
//

import Foundation
import UIKit

class TetanicView: UIView{
    
    static let id = "TetanicCell"
    let query = "tetanic"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let tetanicViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.3)
  
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.97, alpha: 1.00)
        
        view.layer.borderWidth = 1 // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.23, green: 0.65, blue: 0.73, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
    
    let tetanicLabel = LabelComponentView()
    
    let igDropDown = DropDownMenuComponent()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
      
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: tetanicViewSize.width ,height: tetanicViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(tetanicLabel)
        tetanicLabel.setupLabel(labelText: "Vacinas", labelType: .title, labelColor: .black)
        tetanicLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: tetanicLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.26)
        contentBackGround.centerX(inView: roudedBackGround)
        
        
        igDropDown.setupButton()
        igDropDown.tableBarView.setupDropDownOptions = ["aaaa", "bbbbb", "ccccc", "ddddd" , "fffffff"]
        
        
        
        contentBackGround.addSubview(igDropDown)
        igDropDown.anchorWithConstantValues(top: contentBackGround.topAnchor ,width: screenSize.width * 0.35, height: screenSize.height * 0.035)
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
