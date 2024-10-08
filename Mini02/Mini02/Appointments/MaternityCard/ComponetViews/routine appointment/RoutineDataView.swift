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
        view.backgroundColor = UIColor.notQuiteWhite()
        
        view.layer.borderWidth = 2 // Adjust the width as needed
        view.layer.borderColor = UIColor.darkPink().cgColor // Change color as needed
        
        return view
    }()
    

    let routineLabel = LabelComponentView()
    
    let separator = CustomSeparatorView()
    
    let igLabel = LabelComponentView()
        
    let igMenu = NumericPicker()
    
    let uterineHeightLabel = LabelComponentView()
    
    let uterineHeightMenu = NumericPicker()
    
    let arterialPressureLabel = LabelComponentView()
    
    let arterialPressureMenu = RoundedTextField()
    
   
    let wheightLabel = LabelComponentView()
    
    let wheightMenu = NumericFloatPicker()
    
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
        routineLabel.setupLabel(labelText: "Dados de rotina".localized(), labelType: .titleRegular, labelColor: .darkPink)
        routineLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .phone {
            routineLabel.maximumContentSizeCategory = .extraLarge
        }
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: routineLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.3)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: 15, bottomPadding: -15, width: SeparatorWidth.internVertical.value)
        separator.centerX(inView: contentBackGround)
        separator.backgroundColor = UIColor.lilLessDarkPink()
       
        numericPickerPlusLabel(label: igLabel, menu: igMenu, menuMinimum: 0, menuMaximum: 42, menuInterval: 1, contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: contentBackGround, labelText: "IG DUM/USG", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        
        numericPickerPlusLabel(label: uterineHeightLabel, menu: uterineHeightMenu, menuMinimum: 4, menuMaximum: 40, menuInterval: 1, menuDefaultValue: 5, contentBackGround: contentBackGround, topAnchor: igMenu, leftAnchor: contentBackGround, labelText: "Altura uterina(cm)".localized(), topPadding: screenSize.height * 0.0082, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        textFieldPlusLabel(label: arterialPressureLabel, field: arterialPressureMenu, placeholder: "120/80", alternateBackground: true, contentBackGround: contentBackGround, topAnchor: uterineHeightMenu, leftAnchor: contentBackGround, labelText: "Pressão arterial".localized(), topPadding: screenSize.height * 0.0082, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
    
        numericFloatPickerPlusLabel(label: wheightLabel, menu: wheightMenu, menuMinimum: 0.0, menuMaximum: 5, menuInterval: 0.1, contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: separator, labelText: "Peso (KG)/IMC".localized(), topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        
        menuPlusLabelBottom(label: bcfLabel, menu: bcfMenu, options: ["Baixo".localized(), "Moderado".localized(), "Alto".localized()], alternateBackground: true, contentBackGround: contentBackGround, topAnchor: wheightMenu, leftAnchor: separator, labelText: "BCF",  topPadding: screenSize.height * 0.0013, leftPadding: screenSize.width * 0.0065, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        
        menuPlusLabelBottom(label: edemaLabel, menu: edemaMenu, options: ["Normal", "Leve".localized(), "Grave".localized()], alternateBackground: true, contentBackGround: contentBackGround, topAnchor: bcfMenu, leftAnchor: separator, labelText: "Edema", topPadding: screenSize.height * 0.0013, leftPadding: screenSize.width * 0.0065, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
