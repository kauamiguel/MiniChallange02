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
        view.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.97, alpha: 1.00)
        
        view.layer.borderWidth = 1 // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.23, green: 0.65, blue: 0.73, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    let separator = CustomSeparatorView()

    let ultrasoundLabel = LabelComponentView()
    let ultrasoundSubLabel = LabelComponentView()
    
    let dataLabel = LabelComponentView()
    let dataMenu = PullDownComponent()
    
    let pesoLabel = LabelComponentView()
    let pesoMenu = PullDownComponent()
    
    let ilaLabel = LabelComponentView()
    let ilaMenu = PullDownComponent()
    
   
    let igLabel = LabelComponentView()
    let igMenu = PullDownComponent()
    
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
        ultrasoundLabel.setupLabel(labelText: "Ultra sonografia", labelType: .titleBold, labelColor: .secondaryColor)
        ultrasoundLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: ultrasoundLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.34)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: screenSize.height * 0.080, bottomPadding: -15, width: 1.5)
        separator.centerX(inView: contentBackGround)
        
        contentBackGround.addSubview(ultrasoundSubLabel)
        ultrasoundSubLabel.setupLabel(labelText: "Exame mais recente", labelType: .inputLabel, labelColor: .secondaryText)
        ultrasoundSubLabel.anchorWithMultiplayerValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor ,topPadding: screenSize.height * 0.0023 ,leftPadding: screenSize.width * 0.005)
        
        //FIXME: THIS IS A DATE PICKER
        menuPlusLabelBottom(label: dataLabel, menu: dataMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: ultrasoundSubLabel, leftAnchor: contentBackGround, labelText: "Data", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        //FIXME: THIS IS A PICKER
        menuPlusLabelBottom(label: pesoLabel, menu: pesoMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: dataMenu, leftAnchor: contentBackGround, labelText: "Peso", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        //FIXME: NOT MODELED
        menuPlusLabelBottom(label: ilaLabel, menu: ilaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: pesoMenu, leftAnchor: contentBackGround, labelText: "ILA", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        //FIXME: THIS IS A PICKER
        menuPlusLabelBottom(label: igLabel, menu: igMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: ultrasoundSubLabel, leftAnchor: separator, labelText: "IG", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelBottom(label: placentaLabel, menu: placentaMenu, options: Placenta.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: igMenu, leftAnchor: separator, labelText: "Placenta",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        menuPlusLabelBottom(label: apresentacaoFetalLabel, menu: apresentacaoFetalMenu, options: FetalPosition.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: placentaMenu, leftAnchor: separator, labelText: "Apresentação Fetal", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
