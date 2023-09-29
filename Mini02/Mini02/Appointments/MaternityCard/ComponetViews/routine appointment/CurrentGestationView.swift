//
//  CurrentGestationView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 29/09/23.
//

import UIKit



class CurrentGestationView: UIView {
    
    static let id = "CurrentGestationCell"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let currentGestationViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.35)
    
    
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
    
    
    let currentGestationLabel = LabelComponentView()
    
    /* ----------------------------------------------------------smoke------------------------------------------------------------- */
    
    
    let smokeLabelYES = LabelComponentView()
    
    let smokeLabel = LabelComponentView()
    
    let smokeCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var smokeSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------alcool------------------------------------------------------------- */
    let alcoolabelYES = LabelComponentView()
    
    let alcoolLabel = LabelComponentView()
    
    let alcoolcheckYES = CheckBoxComponentGreenView()
    
    lazy var alcoolSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------otherDrugs------------------------------------------------------------- */
    let otherDrugsLabelYES = LabelComponentView()
    
    let otherDrugsLabel = LabelComponentView()
    
    let otherDrugsCheckYES = CheckBoxComponentGreenView()
    
    lazy var otherDrugsSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------HIV/AIDS------------------------------------------------------------- */
    let hivAidsLabelYES = LabelComponentView()
    
    let hivAidsLabel = LabelComponentView()
    
    let hivAidsCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var hivAidsSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
   
    /* ---------------------------------------------------------Syphilis------------------------------------------------------------- */
    
    let syphilisLabelYES = LabelComponentView()
    
    let syphilisLabel = LabelComponentView()
    
    let syphilisCheckYES = CheckBoxComponentGreenView()
    
    lazy var syphilisSubHStack: UIStackView = {
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
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: currentGestationViewSize.width ,height: currentGestationViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(currentGestationLabel)
        currentGestationLabel.setupLabel(labelText: "Gestação atual", labelType: .title, labelColor: .black)
        currentGestationLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: currentGestationLabel.bottomAnchor, bottom: self.bottomAnchor, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        
        /* ----------------------------------------------------------smoke------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: smokeSubHStack,label: smokeLabel,checkBox: smokeCheckYES,labelText: "Fuma")
        
        contentBackGround.addSubview(smokeSubHStack)
        smokeSubHStack.anchorWithConstantValues(top: currentGestationLabel.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15 ,leftPadding: 10,rightPadding: -34)
        
        /* ----------------------------------------------------------alcool------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: alcoolSubHStack,label: alcoolLabel,checkBox: alcoolcheckYES,labelText: "Consome álcool")
        
        contentBackGround.addSubview(alcoolSubHStack)
        alcoolSubHStack.anchorWithConstantValues(top: smokeSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
        
        /* ----------------------------------------------------------otherDrugs------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: otherDrugsSubHStack,label: otherDrugsLabel,checkBox: otherDrugsCheckYES,labelText: "Outras drogas")
        
        contentBackGround.addSubview(otherDrugsSubHStack)
        otherDrugsSubHStack.anchorWithConstantValues(top: alcoolSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15,leftPadding: 10 ,rightPadding: -34)
        
        /* ----------------------------------------------------------HIV/AIDS------------------------------------------------------------- */
        configureLabelAndGreenCheckBox(stack: hivAidsSubHStack,label: hivAidsLabelYES, checkBox: hivAidsCheckYES,labelText: "HIV/Aids")
        
        contentBackGround.addSubview(hivAidsSubHStack)
        hivAidsSubHStack.anchorWithConstantValues(top: otherDrugsSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10, rightPadding: -34)
        
        /* ---------------------------------------------------------Syphilis------------------------------------------------------------- */
       
        configureLabelAndGreenCheckBox(stack:  syphilisSubHStack,label:  syphilisLabelYES, checkBox:  syphilisCheckYES,labelText: "Sífilis")
        
        contentBackGround.addSubview(syphilisSubHStack)
        syphilisSubHStack.anchorWithConstantValues(top: hivAidsSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, bottom: contentBackGround.bottomAnchor, topPadding: 15, leftPadding: 10, rightPadding: -34, bottomPadding: -15)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


