//
//  RoutineData.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import UIKit

class RoutineDataView: UIView {


    static let id = "RoutineDataCell"
    let query = "rotina"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let routineDataViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.34)
    
    
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
    

    let routineLabel = LabelComponentView()
    
    /* ----------------------------------------------------------IG -DUM/USG------------------------------------------------------------- */
    let separator = CustomSeparatorView()
    
    let igLabel = LabelComponentView()
    
    let igDropDown = DropDownMenuComponent()
    
    let uterineHeightLabel = LabelComponentView()
    
    let uterineHeightDropDown = DropDownMenuComponent()
    
    let arterialPressureLabel = LabelComponentView()
    
    let arterialPressureDropDown = DropDownMenuComponent()
    
    
    
    
    
    let wheightLabel = LabelComponentView()
    
    let wheightDropDown = DropDownMenuComponent()
    
    let bcfLabel = LabelComponentView()
    
    let bcfDropDown = DropDownMenuComponent()
    
    let edemaLabel = LabelComponentView()
    
    let edemaDropDown = DropDownMenuComponent()
    
  
    

  
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
        /* ----------------------------------------------------------routine------------------------------------------------------------- */
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: routineDataViewSize.width ,height: routineDataViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(routineLabel)
        routineLabel.setupLabel(labelText: "Dados de rotina", labelType: .title, labelColor: .black)
        routineLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: routineLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.3)
        contentBackGround.centerX(inView: roudedBackGround)
        
        /* ----------------------------------------------------------IIG -DUM/USG-G------------------------------------------------------------- */

        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: 15, bottomPadding: -15, width: 1.5)
        separator.centerX(inView: contentBackGround)
       
        DropDownPlusLabelTop(label: igLabel, dropDown: igDropDown, contentBackGround: contentBackGround, topAnchor: contentBackGround, labelText: "IG -DUM/USG", dropDownOptions: ["AAA", "BBBB", "CCC"], topPadding: 15, leftPadding: 15, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        DropDownPlusLabelBottom(label: uterineHeightLabel, dropDown: uterineHeightDropDown, contentBackGround: contentBackGround, topAnchor: igDropDown, labelText: "Altura uterina (cm)", dropDownOptions: ["AAA", "BBBB", "CCC"], topPadding: 34, leftPadding: 15, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
     
        DropDownPlusLabelBottom(label: arterialPressureLabel, dropDown: arterialPressureDropDown, contentBackGround: contentBackGround, topAnchor: uterineHeightDropDown, labelText: "Pressão arterial(mmHG)", dropDownOptions: ["AAA", "BBBB", "CCC"], topPadding: 34, leftPadding: 15, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
