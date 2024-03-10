//
//  BloodView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class BloodView: UIView{
    
    static let id = "BloodCell"
    let query = "exame de sangue"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let bloodViewViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.5)
  
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor.notQuiteWhite()
        
        view.layer.borderWidth = SeparatorWidth.extern.value // Adjust the width as needed
        view.layer.borderColor = UIColor.darkPink().cgColor // Change color as needed
        
        return view
    }()
    
    let separator = CustomSeparatorView()
    let bloodExamLabel = LabelComponentView()
    

    
    let aboLabel = LabelComponentView()
    let aboMenu = PullDownComponent()
    
    let htLabel = LabelComponentView()
    let htMenu = NumericPicker()
    
    let hbLabel = LabelComponentView()
    let hbMenu = NumericFloatPicker()
    
    let plaquetasLabel = LabelComponentView()
    let  plaquetasMenu = NumericPicker()
    
   
    let leucocitosLabel = LabelComponentView()
    let leucocitosMenu = NumericPicker()
    
    let glicemiaLabel = LabelComponentView()
    let glicemiaMenu = NumericPicker()
    
    let ureiaLabel = LabelComponentView()
    let ureiaMenu = NumericPicker()
    
    let creatineLabel = LabelComponentView()
    let creatineMenu  = NumericFloatPicker()
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
 
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: bloodViewViewSize.width ,height: bloodViewViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(bloodExamLabel)
        bloodExamLabel.setupLabel(labelText: "Exame de sangue".localized(), labelType: .titleRegular, labelColor: .darkPink)
        bloodExamLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .phone {
            bloodExamLabel.maximumContentSizeCategory = .extraLarge
        }
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: bloodExamLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.43)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: 15, bottomPadding: -15, width: SeparatorWidth.internVertical.value)
        separator.centerX(inView: contentBackGround)
        separator.backgroundColor = UIColor.darkPink()
        
        
     
        
        menuPlusLabel(label: aboLabel, menu: aboMenu, alternateBackground: true, options: BloodType.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: contentBackGround, labelText: "ABO - RH", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        numericPickerPlusLabel(label: htLabel, menu: htMenu, menuMinimum: 39, menuMaximum: 90, menuInterval: 1, contentBackGround: contentBackGround, topAnchor: aboMenu, leftAnchor: contentBackGround, labelText: "HTª(%)", topPadding: screenSize.height * 0.008, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        //FIXME: FLOAT PICKER INSTEAD
        numericFloatPickerPlusLabel(label: hbLabel, menu: hbMenu, menuMinimum: 12.0, menuMaximum: 18.0, menuInterval: 0.1, contentBackGround: contentBackGround, topAnchor: htMenu, leftAnchor: contentBackGround, labelText: "HB(g/dL)", topPadding: screenSize.height * 0.0088, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        numericPickerPlusLabel(label: plaquetasLabel, menu: plaquetasMenu, menuMinimum: 110000, menuMaximum: 650000, menuInterval: 5000, menuDefaultValue: 450000, contentBackGround: contentBackGround, topAnchor: hbMenu, leftAnchor: contentBackGround, labelText: "Plaquetas".localized(), topPadding: screenSize.height * 0.0085, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)

        // RIGHT
        numericPickerPlusLabel(label: ureiaLabel, menu: ureiaMenu, menuMinimum: 4, menuMaximum: 25, menuInterval: 1, contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: separator, labelText: "Ureia (mg/dl)".localized(), topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        numericPickerPlusLabel(label: leucocitosLabel, menu: leucocitosMenu, menuMinimum: 3000, menuMaximum: 14000, menuInterval: 1000, menuDefaultValue: 4000, contentBackGround: contentBackGround, topAnchor: ureiaMenu, leftAnchor: separator, labelText: "Leucócitos".localized(), topPadding: screenSize.height * 0.0082, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
       
        numericPickerPlusLabel(label: glicemiaLabel, menu: glicemiaMenu, menuMinimum: 65, menuMaximum: 170, menuInterval: 5, contentBackGround: contentBackGround, topAnchor: leucocitosMenu, leftAnchor: separator, labelText: "Glicemia(mg/dl)".localized(), topPadding: screenSize.height * 0.0085, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        // FIXME: FLOAT PICKER INSTED
        numericFloatPickerPlusLabel(label: creatineLabel, menu: creatineMenu, menuMinimum: 0.4, menuMaximum: 1.4, menuInterval: 0.1, contentBackGround: contentBackGround, topAnchor: glicemiaMenu, leftAnchor: separator, labelText: "Creatina(mg/dl)".localized(), topPadding: screenSize.height * 0.0092, leftPadding: screenSize.width * 0.0085, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
