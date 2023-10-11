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
        view.backgroundColor = UIColor(red: 0.95, green: 0.98, blue: 1.00, alpha: 1.00)
        
        view.layer.borderWidth = 1 // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.32, green: 0.67, blue: 0.86, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
    
    let tetanicLabel = LabelComponentView()
    
    let subTitleLabel = LabelComponentView()
    
    
    let yesLabel = LabelComponentView()
    let yesCheckYES = CheckBoxComponentGreenView()
    
    let noLabel = LabelComponentView()
    let noCheckNO = CheckBoxComponentRedView()

  
    lazy var yesSubHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var noSubHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
      
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: tetanicViewSize.width ,height: tetanicViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(tetanicLabel)
        tetanicLabel.setupLabel(labelText: "Vacinas", labelType: .titleBold, labelColor: .secondaryColor)
        tetanicLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: tetanicLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.26)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(subTitleLabel)
        subTitleLabel.setupLabel(labelText: "Anti-tetânica/ dTpa", labelType: .titleRegular, labelColor: .secondaryText)
        subTitleLabel.anchorWithConstantValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor,topPadding: 15, leftPadding: 15)
        
        invertConfigureLabelAndGreenCheckBox(stack: yesSubHStackYES, label: yesLabel, checkBox: yesCheckYES, labelText: "sim, reforço 20 semanas: ")
        invertConfigureLabelAndRedCheckBox(stack: noSubHStackNO, label: noLabel, checkBox: noCheckNO, labelText: "não, esquema completo:")
        
        roudedBackGround.addSubview(yesSubHStackYES)
        yesSubHStackYES.anchorWithConstantValues(top: subTitleLabel.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)
        
        roudedBackGround.addSubview(noSubHStackNO)
        noSubHStackNO.anchorWithConstantValues(top: yesSubHStackYES.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)
//        igDropDown.setupButton()
//        igDropDown.tableBarView.setupDropDownOptions = ["aaaa", "bbbbb", "ccccc", "ddddd" , "fffffff"]

//        contentBackGround.addSubview(igDropDown)
//        igDropDown.anchorWithConstantValues(top: contentBackGround.topAnchor ,width: screenSize.width * 0.35, height: screenSize.height * 0.035)
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
