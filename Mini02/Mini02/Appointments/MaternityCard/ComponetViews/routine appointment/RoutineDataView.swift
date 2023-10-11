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
    
    
    let separator = CustomSeparatorView()
    
    let igLabel = LabelComponentView()
        
    let igMenu = PullDownComponent()
    
    let uterineHeightLabel = LabelComponentView()
    
    let uterineHeightMenu = PullDownComponent()
    
    let arterialPressureLabel = LabelComponentView()
    
    let arterialPressureMenu = PullDownComponent()
    
   
    let wheightLabel = LabelComponentView()
    
    let wheightMenu = PullDownComponent()
    
    let bcfLabel = LabelComponentView()
    
    let bcfMenu = PullDownComponent()
    
    let edemaLabel = LabelComponentView()
    
    let edemaMenu = PullDownComponent()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: routineDataViewSize.width ,height: routineDataViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        self.addSubview(routineLabel)
        routineLabel.setupLabel(labelText: "Dados de rotina", labelType: .titleBold, labelColor: .secondaryColor)
        routineLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: routineLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.3)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: 15, bottomPadding: -15, width: 1.5)
        separator.centerX(inView: contentBackGround)
       
        menuPlusLabel(label: igLabel, menu: igMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: contentBackGround, labelText: "IG -DUM/USG", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelBottom(label: uterineHeightLabel, menu: uterineHeightMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: igMenu, leftAnchor: contentBackGround, labelText: "Altura uterina (cm)", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelBottom(label: arterialPressureLabel, menu: arterialPressureMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: uterineHeightMenu, leftAnchor: contentBackGround, labelText: "Pressão arterial ", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelRight(label: wheightLabel, menu: wheightMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: separator, labelText: "Peso (Kg)/IMC", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelBottom(label: bcfLabel, menu: bcfMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: wheightMenu, leftAnchor: separator, labelText: "BCF",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelBottom(label: edemaLabel, menu: edemaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: bcfMenu, leftAnchor: separator, labelText: "Edema", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
