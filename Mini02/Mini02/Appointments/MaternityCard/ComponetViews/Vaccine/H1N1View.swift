//
//  H1N1View.swift
//  Mini02
//
//  Created by Gabriel Eirado on 04/10/23.
//

import Foundation
import UIKit

class H1N1View: UIView{
    
    static let id = "H1N1ViewCell"
    let query = "H1N1"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let h1N1ViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.11)
  
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

    
    let igDropDown = DropDownMenuComponent()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
      
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: h1N1ViewSize.width ,height: h1N1ViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
    
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: roudedBackGround.topAnchor, bottom: roudedBackGround.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9)
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
