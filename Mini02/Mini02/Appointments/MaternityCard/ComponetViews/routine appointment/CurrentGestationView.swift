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
        AppointmentsKeys.fuma.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.consomeAlcool.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.outrasDrogas.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.hivAids.rawValue.localized() :CheckBoxComponentGreenView(),
        AppointmentsKeys.sifilis.rawValue.localized() :CheckBoxComponentGreenView()
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
        view.backgroundColor = UIColor.notQuiteWhite()
        
        view.layer.borderWidth = SeparatorWidth.extern.value // Adjust the width as needed
        view.layer.borderColor = UIColor.darkPink().cgColor // Change color as needed
        
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
        currentGestationLabel.setupLabel(labelText: "Gestação atual".localized(), labelType:  .titleRegular, labelColor: .darkPink)
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


