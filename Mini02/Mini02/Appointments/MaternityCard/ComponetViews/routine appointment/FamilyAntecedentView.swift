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
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let familyAntecedentViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.28)
    
    
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
    

    let antecedentesLabel = LabelComponentView()
    
    /* ----------------------------------------------------------HYPERTENSION------------------------------------------------------------- */
    
    
    let hypertensionLabelYES = LabelComponentView()
    
    let hypertensionLabel = LabelComponentView()
    
    let hypertensionCheckYES = CheckBoxComponentGreenView()

    
    lazy var hypertensionSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------Diabetes------------------------------------------------------------- */
    let diabetesLabelYES = LabelComponentView()
   
    let diabetesLabel = LabelComponentView()
    
    let diabetesCheckYES = CheckBoxComponentGreenView()
    
    lazy var diabetesSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------TWIN------------------------------------------------------------- */
    let twinLabelYES = LabelComponentView()

    let twinLabel = LabelComponentView()
    
    let twinCheckYES = CheckBoxComponentGreenView()
    
    lazy var twinSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------OTHER------------------------------------------------------------- */
    let otherLabelYES = LabelComponentView()
    
    let otherLabel = LabelComponentView()
    
    let otherCheckYES = CheckBoxComponentGreenView()
   
    
    lazy var otherSubHStack: UIStackView = {
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
        
        /* ----------------------------------------------------------Antecedentes------------------------------------------------------------- */
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: familyAntecedentViewSize.width ,height: familyAntecedentViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(antecedentesLabel)
        antecedentesLabel.setupLabel(labelText: "Antecedentes Familiares", labelType: .title, labelColor: .black)
        antecedentesLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: antecedentesLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
     
        /* ----------------------------------------------------------HYPERTENSION------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: hypertensionSubHStack,label: hypertensionLabel,checkBox: hypertensionCheckYES,labelText: "hipertenção")
        
        contentBackGround.addSubview(hypertensionSubHStack)
        hypertensionSubHStack.anchorWithConstantValues(top: contentBackGround.topAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
        
        /* ----------------------------------------------------------Diabetes------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: diabetesSubHStack,label: diabetesLabel,checkBox: diabetesCheckYES,labelText: "Diabetes")
        
        contentBackGround.addSubview(diabetesSubHStack)
        diabetesSubHStack.anchorWithConstantValues(top: hypertensionSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
        
        /* ----------------------------------------------------------TWINe------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: twinSubHStack,label: twinLabel,checkBox: twinCheckYES,labelText: "Gemelar")
        
        contentBackGround.addSubview(twinSubHStack)
        twinSubHStack.anchorWithConstantValues(top: diabetesSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15,leftPadding: 10 ,rightPadding: -34)
        
        /* ----------------------------------------------------------OTHER------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: otherSubHStack,label: otherLabelYES, checkBox: otherCheckYES,labelText: "Other")
        
        contentBackGround.addSubview(otherSubHStack)
        otherSubHStack.anchorWithConstantValues(top: twinSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, bottom: contentBackGround.bottomAnchor, topPadding: 15, leftPadding: 10, rightPadding: -34, bottomPadding: -15)
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





