//
//  ClinicAntecedentsView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 29/09/23.
//

import UIKit

class ClinicAntecedentsView: UIView {

    static let id = "ClinicAntecedentsCell"
    let query = "antecedentes clinicos"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let clinicAntecedentsViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.35)
    
    
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
   
    /* ---------------------------------------------------------- Antecedentes clínicos obstétricos------------------------------------------------------------- */
   
    let clinicAntecedentsLabel = LabelComponentView()
    
    /* ----------------------------------------------------------Diabetes------------------------------------------------------------- */
    
    
    let clinicDiabetesLabelYES = LabelComponentView()
    
    let clinicDiabetesabel = LabelComponentView()
    
    let clinicDiabetesCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var clinicDiabetesSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------alcool------------------------------------------------------------- */
    let clinicAlcoolabelYES = LabelComponentView()
    
    let clinicAlcoolLabel = LabelComponentView()
    
    let clinicAlcoolcheckYES = CheckBoxComponentGreenView()
    
    lazy var clinicAlcoolSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------otherDrugs------------------------------------------------------------- */
    let clinicOtherDrugsLabelYES = LabelComponentView()
    
    let clinicOtherDrugsLabel = LabelComponentView()
    
    let clinicOtherDrugsCheckYES = CheckBoxComponentGreenView()
    
    lazy var clinicOtherDrugsSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------HIV/AIDS------------------------------------------------------------- */
    let clinicHivAidsLabelYES = LabelComponentView()
    
    let clinicHivAidsLabel = LabelComponentView()
    
    let clinicHivAidsCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var clinicHivAidsSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
   
    /* ---------------------------------------------------------Syphilis------------------------------------------------------------- */
    
    let clinicSyphilisLabelYES = LabelComponentView()
    
    let clinicSyphilisLabel = LabelComponentView()
    
    let clinicSyphilisCheckYES = CheckBoxComponentGreenView()
    
    lazy var clinicSyphilisSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){

        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: clinicAntecedentsViewSize.width ,height: clinicAntecedentsViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(clinicAntecedentsLabel)
        clinicAntecedentsLabel.setupLabel(labelText: "Antecedentes clínicos obstétricos", labelType: .medicText, labelColor: .black)
        clinicAntecedentsLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: clinicAntecedentsLabel.bottomAnchor, bottom: self.bottomAnchor, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        
        /* ----------------------------------------------------------smoke------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: clinicDiabetesSubHStack,label: clinicDiabetesabel,checkBox: clinicDiabetesCheckYES,labelText: "Diabetes")
        
        contentBackGround.addSubview(clinicDiabetesSubHStack)
        clinicDiabetesSubHStack.anchorWithConstantValues(top: clinicAntecedentsLabel.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15 ,leftPadding: 10,rightPadding: -34)
        
        /* ----------------------------------------------------------alcool------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: clinicAlcoolSubHStack,label: clinicAlcoolLabel,checkBox: clinicAlcoolcheckYES,labelText: "Consome álcool")
        
        contentBackGround.addSubview(clinicAlcoolSubHStack)
        clinicAlcoolSubHStack.anchorWithConstantValues(top: clinicDiabetesSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
//
//        /* ----------------------------------------------------------otherDrugs------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: clinicOtherDrugsSubHStack,label: clinicOtherDrugsLabel,checkBox: clinicOtherDrugsCheckYES,labelText: "Outras drogas")
        
        contentBackGround.addSubview(clinicOtherDrugsSubHStack)
        clinicOtherDrugsSubHStack.anchorWithConstantValues(top: clinicAlcoolSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15,leftPadding: 10 ,rightPadding: -34)
//
//        /* ----------------------------------------------------------HIV/AIDS------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: clinicHivAidsSubHStack,label: clinicHivAidsLabelYES, checkBox: clinicHivAidsCheckYES,labelText: "HIV/Aids")
        
        contentBackGround.addSubview(clinicHivAidsSubHStack)
        clinicHivAidsSubHStack.anchorWithConstantValues(top: clinicOtherDrugsSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10, rightPadding: -34)
        
        /* ---------------------------------------------------------Syphilis------------------------------------------------------------- */
       
        configureLabelAndGreenCheckBox(stack:  clinicSyphilisSubHStack,label:  clinicSyphilisLabelYES, checkBox:  clinicSyphilisCheckYES,labelText: "Sífilis")
        
        contentBackGround.addSubview(clinicSyphilisSubHStack)
        clinicSyphilisSubHStack.anchorWithConstantValues(top: clinicHivAidsSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, bottom: contentBackGround.bottomAnchor, topPadding: 15, leftPadding: 10, rightPadding: -34, bottomPadding: -15)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
