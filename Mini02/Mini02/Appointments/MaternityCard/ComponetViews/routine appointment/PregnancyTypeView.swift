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
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let pregnancyTypeViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.28)
    
    
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
    
    /* ----------------------------------------------------------Tipos de gravidez------------------------------------------------------------- */
    
    let pregnancyTypeLabel = LabelComponentView()
    
    /* ----------------------------------------------------------única------------------------------------------------------------- */
    
    let uniqueLabel = LabelComponentView()
    
    let uniqueCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var uniqueSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    /* ----------------------------------------------------------twinType------------------------------------------------------------- */
    
    let twinTypeLabel = LabelComponentView()
    
    let twinTypeCheckYES = CheckBoxComponentGreenView()
    
    lazy var twinTypeSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
    /* ----------------------------------------------------------triple or more------------------------------------------------------------- */
    
    let tripleOrMoreLabel = LabelComponentView()
    
    let tripleOrMoreCheckYES = CheckBoxComponentGreenView()
    
    lazy var tripleOrMoreSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
    /* ----------------------------------------------------------ignored------------------------------------------------------------- */
    let ignoredLabel = LabelComponentView()
    
    let ignoredCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var ignoredSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    
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
        contentBackGround.anchorWithConstantValues(top: pregnancyTypeLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        /* ----------------------------------------------------------Tipos de gravidez------------------------------------------------------------- */
        
        
        /* ----------------------------------------------------------única------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: uniqueSubHStack,label: uniqueLabel,checkBox: uniqueCheckYES,labelText: "Única")
        
        contentBackGround.addSubview(uniqueSubHStack)
        uniqueSubHStack.anchorWithConstantValues(top: contentBackGround.topAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
        
        /* ----------------------------------------------------------twinType------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: twinTypeSubHStack,label: twinTypeLabel,checkBox: twinTypeCheckYES,labelText: "Gemelar")
        
        contentBackGround.addSubview(twinTypeSubHStack)
        twinTypeSubHStack.anchorWithConstantValues(top: uniqueSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)

        /* ----------------------------------------------------------triple or more------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: tripleOrMoreSubHStack,label: tripleOrMoreLabel,checkBox: tripleOrMoreCheckYES,labelText: "Tripla ou mais")
        
        contentBackGround.addSubview(tripleOrMoreSubHStack)
        tripleOrMoreSubHStack.anchorWithConstantValues(top: twinTypeSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15,leftPadding: 10 ,rightPadding: -34)

        /* ----------------------------------------------------------ignored------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: ignoredSubHStack,label: ignoredLabel,checkBox: ignoredCheckYES,labelText: "Ignorada")
        
        contentBackGround.addSubview(ignoredSubHStack)
        ignoredSubHStack.anchorWithConstantValues(top: tripleOrMoreSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, bottom: contentBackGround.bottomAnchor, topPadding: 15, leftPadding: 10, rightPadding: -34, bottomPadding: -15)

        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


