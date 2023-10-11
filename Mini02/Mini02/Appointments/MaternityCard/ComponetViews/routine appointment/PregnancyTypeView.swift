//
//  PregnancyTypeView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import Foundation
import UIKit

class PregnancyTypeView: UIView {
    
    static let id = "PregnancyTypeCell"

    let query = "gravidez"
    
    let section = [
        "Unica":CheckBoxComponentGreenView(),
        "Gemelar":CheckBoxComponentGreenView(),
        "Tripla ou mais":CheckBoxComponentGreenView(),
        "Ignorada":CheckBoxComponentGreenView()
    ]

    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let pregnancyTypeViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.33)
    
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.96, alpha: 1.00)
        
        view.layer.borderWidth = 1 // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.49, green: 0.74, blue: 0.50, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
    /* ----------------------------------------------------------Tipos de gravidez------------------------------------------------------------- */
    
    let pregnancyTypeLabel = LabelComponentView()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: pregnancyTypeViewSize.width ,height: pregnancyTypeViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        
        /* ----------------------------------------------------------risk------------------------------------------------------------- */
        self.addSubview(pregnancyTypeLabel)
        pregnancyTypeLabel.setupLabel(labelText: "Tipos de gravidez", labelType: .title, labelColor: .black)
        pregnancyTypeLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: pregnancyTypeLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9, height: screenSize.height * 0.28)
        contentBackGround.centerX(inView: roudedBackGround)
        
        /* ----------------------------------------------------------Tipos de gravidez------------------------------------------------------------- */
        createSection(bg: contentBackGround, titles: section)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


