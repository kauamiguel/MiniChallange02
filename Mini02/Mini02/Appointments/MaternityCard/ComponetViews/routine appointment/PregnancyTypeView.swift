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
        AppointmentsKeys.unica.rawValue :CheckBoxComponentGreenView(),
        AppointmentsKeys.gemelar.rawValue :CheckBoxComponentGreenView(),
        AppointmentsKeys.triplaOuMais.rawValue :CheckBoxComponentGreenView()
    ]

    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let pregnancyTypeViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.25)
    
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor.notQuiteWhite()
        
        view.layer.borderWidth = SeparatorWidth.extern.value // Adjust the width as needed
        view.layer.borderColor = UIColor.darkPink().cgColor // Change color as needed
        
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
        
        
        
        self.addSubview(pregnancyTypeLabel)
        pregnancyTypeLabel.setupLabel(labelText: "Tipos de gravidez".localized(), labelType:  .titleRegular, labelColor: .darkPink)
        pregnancyTypeLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .phone {
            pregnancyTypeLabel.maximumContentSizeCategory = .extraLarge
        }
        
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: pregnancyTypeLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9, height: screenSize.height * 0.20)
        contentBackGround.centerX(inView: roudedBackGround)
 
        createSection(bg: contentBackGround, titles: section)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


