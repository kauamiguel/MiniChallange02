//
//  ultrasoundView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class UltrasoundView: UIView {

    static let id = "UltrasoundViewCell"
    let query = "ultrassom"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let ultrasoundSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.38)
  
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.98, alpha: 1.00)
        
        view.layer.borderWidth = SeparatorWidth.extern.value // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.91, green: 0.41, blue: 0.41, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    let separator = CustomSeparatorView()

    let ultrasoundLabel = LabelComponentView()
    let ultrasoundSubLabel = LabelComponentView()
    
    let dataLabel = LabelComponentView()
    let dataMenu = DatePicker()
    
    let pesoLabel = LabelComponentView()
    let pesoMenu = NumericPicker()
    
    let ilaLabel = LabelComponentView()
    let ilaMenu = NumericPicker()
    
   
    let igLabel = LabelComponentView()
    let igMenu = NumericPicker()
    
    let placentaLabel = LabelComponentView()
    let placentaMenu = PullDownComponent()
    
    let apresentacaoFetalLabel = LabelComponentView()
    let apresentacaoFetalMenu = PullDownComponent()
   
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
      
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: ultrasoundSize.width ,height: ultrasoundSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
    
        
        
        self.addSubview(ultrasoundLabel)
        ultrasoundLabel.setupLabel(labelText: "Ultra sonografia".localized(), labelType: .titleBold, labelColor: .secondaryColor)
        ultrasoundLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .phone {
            ultrasoundLabel.maximumContentSizeCategory = .extraLarge
        }
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: ultrasoundLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.34)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: screenSize.height * 0.080, bottomPadding: -15, width: SeparatorWidth.internVertical.value)
        separator.centerX(inView: contentBackGround)
        separator.backgroundColor = UIColor(red: 0.91, green: 0.41, blue: 0.41, alpha: 1.00)
        
        contentBackGround.addSubview(ultrasoundSubLabel)
        ultrasoundSubLabel.setupLabel(labelText: "Exame mais recente".localized(), labelType: .inputLabel, labelColor: .secondaryText)
        ultrasoundSubLabel.anchorWithMultiplayerValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor ,topPadding: screenSize.height * 0.0023 ,leftPadding: screenSize.width * 0.005)
        if UIDevice.current.userInterfaceIdiom == .phone {
            ultrasoundSubLabel.maximumContentSizeCategory = .extraLarge
        }
        

        datePickerPlusLabel(label: dataLabel, date: dataMenu, contentBackGround: contentBackGround, topAnchor: ultrasoundSubLabel, leftAnchor: contentBackGround, labelText: "Data".localized(), topPadding: screenSize.height * 0.0042, leftPadding: screenSize.width * 0.005, screenSize: screenSize, heightMultiplier: 0.052)

        numericPickerPlusLabel(label: pesoLabel, menu: pesoMenu, menuMinimum: 50, menuMaximum: 180, menuInterval: 5, contentBackGround: contentBackGround, topAnchor: dataMenu, leftAnchor: contentBackGround, labelText: "Peso".localized(), topPadding: screenSize.height * 0.009, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        
        numericPickerPlusLabel(label: ilaLabel, menu: ilaMenu, menuMinimum: 4, menuMaximum: 30, menuInterval: 1, contentBackGround: contentBackGround, topAnchor: pesoMenu, leftAnchor: contentBackGround, labelText: "ILA(cm)", topPadding: screenSize.height * 0.009, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.055)
        
//        //FIXME: NOT MODELED
//        menuPlusLabelBottom(label: ilaLabel, menu: ilaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: pesoMenu, leftAnchor: contentBackGround, labelText: "ILA", topPadding: screenSize.height * 0.0036, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.045)

        numericPickerPlusLabel(label: igLabel, menu: igMenu, menuMinimum: 0, menuMaximum: 42, menuInterval: 1, contentBackGround: contentBackGround, topAnchor: ultrasoundSubLabel, leftAnchor: separator, labelText: "IG", topPadding: screenSize.height * 0.0038, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        menuPlusLabelBottom(label: placentaLabel, menu: placentaMenu, options: Placenta.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: igMenu, leftAnchor: separator, labelText: "Placenta",  topPadding: screenSize.height * 0.0032, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.050)
        
        menuPlusLabelBottom(label: apresentacaoFetalLabel, menu: apresentacaoFetalMenu, options: FetalPosition.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: placentaMenu, leftAnchor: separator, labelText: "Apresentação Fetal".localized(), topPadding: screenSize.height * 0.0042, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.042)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
