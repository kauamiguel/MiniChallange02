//
//  CurrentGestationView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 29/09/23.
//

import UIKit



class CurrentGestationView: UIView {
    
    static let id = "CurrentGestationCell"
    let query = "gestacao atual"
    let sections = [
        "Fuma":CheckBoxComponentGreenView(),
        "Consome alcool":CheckBoxComponentGreenView(),
        "Outras Drogas":CheckBoxComponentGreenView(),
        "HIV/Aids":CheckBoxComponentGreenView(),
        "Sifilis":CheckBoxComponentGreenView()
    ]
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let currentGestationViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.38)
    
    
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
    
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){

        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: currentGestationViewSize.width ,height: currentGestationViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(currentGestationLabel)
        currentGestationLabel.setupLabel(labelText: "Gestação atual", labelType: .titleBold, labelColor: .secondaryColor)
        currentGestationLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: currentGestationLabel.bottomAnchor, bottom: self.bottomAnchor, width: screenSize.width * 0.9, height: screenSize.height * 0.34)
        contentBackGround.centerX(inView: roudedBackGround)
        
        
      createSection(bg: contentBackGround, titles: sections)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


