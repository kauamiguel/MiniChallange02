//
//  FamilyAntecedentView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 29/09/23.
//

import UIKit


class FamilyAntecedentView: UIView {
    
    static let id = "FamilyAntecedentCell"
    let query = "antecedente familiar"
   
    let sections = [
        AppointmentsKeys.hipertensao.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.diabetes.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.cardiopatia.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.outro.rawValue.localized() :CheckBoxComponentGreenView()
    ]
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let familyAntecedentViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.31)
    
    
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
    

    let antecedentesLabel = LabelComponentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(){
        
        /* ----------------------------------------------------------Antecedentes------------------------------------------------------------- */
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: familyAntecedentViewSize.width ,height: familyAntecedentViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        self.addSubview(antecedentesLabel)
        antecedentesLabel.setupLabel(labelText: "Antecedentes Familiares".localized(), labelType: .titleBold, labelColor: .secondaryColor)
        antecedentesLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .phone {
            antecedentesLabel.maximumContentSizeCategory = .extraLarge
        }
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: antecedentesLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9, height: screenSize.height * 0.27)
        contentBackGround.centerX(inView: roudedBackGround)
        
        createSection(bg: contentBackGround, titles: sections)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





