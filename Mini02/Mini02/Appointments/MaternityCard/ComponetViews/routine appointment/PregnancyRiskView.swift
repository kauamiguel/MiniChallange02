//
//  PregnancyRisk.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import UIKit

class PregnancyRiskView: UIView {
    
    static let id = "PregnancyRiskCell"
    let className = "pregnancyrisk"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let pregnancyRiskViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.17)
    
    
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
    
    /* ----------------------------------------------------------risk------------------------------------------------------------- */
    
    let riskLabel = LabelComponentView()
    
    /* ----------------------------------------------------------habitual------------------------------------------------------------- */
   
    let habitualLabel = LabelComponentView()
    
    let habitualCheckYES = CheckBoxComponentGreenView()
    
    lazy var habitualSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------high------------------------------------------------------------- */
    
    let highLabel = LabelComponentView()
    
    let highCheckYES = CheckBoxComponentGreenView()
    
    lazy var highSubHStack: UIStackView = {
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
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: pregnancyRiskViewSize.width ,height: pregnancyRiskViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        
        /* ----------------------------------------------------------risk------------------------------------------------------------- */
        
        self.addSubview(riskLabel)
        riskLabel.setupLabel(labelText: "Risco da gravidez ", labelType: .title, labelColor: .black)
        riskLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: riskLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        /* ---------------------------------------------------------- habitual------------------------------------------------------------- */
        
        configureLabelAndGreenCheckBox(stack: habitualSubHStack, label: habitualLabel, checkBox: habitualCheckYES, labelText: "Risco habitual")
        contentBackGround.addSubview(habitualSubHStack)
        habitualSubHStack.anchorWithConstantValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor, topPadding: 15,leftPadding: 10 )
        
    
        configureLabelAndGreenCheckBox(stack: highSubHStack, label: highLabel, checkBox: highCheckYES, labelText: "Alto risco")
        contentBackGround.addSubview(highSubHStack)
        highSubHStack.anchorWithConstantValues(top: habitualSubHStack.bottomAnchor, left: contentBackGround.leadingAnchor, bottom: contentBackGround.bottomAnchor, topPadding: 15,leftPadding: 10, bottomPadding: -15)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


