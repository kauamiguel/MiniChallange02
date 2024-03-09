//
//  ClinicAntecedentsView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 29/09/23.
//

import UIKit

class ClinicAntecedentsView: UIView {

    static let id = "ClinicAntecedentsCell"
    let query = "antecedentes clinicos"
    let sections = [
        AppointmentsKeys.diabetes.rawValue :CheckBoxComponentGreenView(),
        AppointmentsKeys.fuma.rawValue :CheckBoxComponentGreenView(),
        AppointmentsKeys.hipertensao.rawValue :CheckBoxComponentGreenView(),
        AppointmentsKeys.cardiopatia.rawValue :CheckBoxComponentGreenView(),
        AppointmentsKeys.urinary.rawValue :CheckBoxComponentGreenView()
    ]
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let clinicAntecedentsViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.38)
    
    
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
   
    /* ---------------------------------------------------------- Antecedentes clínicos obstétricos------------------------------------------------------------- */
   
    let clinicAntecedentsLabel = LabelComponentView()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){

        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: clinicAntecedentsViewSize.width ,height: clinicAntecedentsViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(clinicAntecedentsLabel)
        clinicAntecedentsLabel.setupLabel(labelText: "Antecedentes clínicos obstétricos".localized(), labelType: .titleBold, labelColor: .darkPink)
        clinicAntecedentsLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .pad {
            clinicAntecedentsLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        }
        clinicAntecedentsLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.98
        clinicAntecedentsLabel.numberOfLines = 3
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: clinicAntecedentsLabel.bottomAnchor, bottom: self.bottomAnchor, width: screenSize.width * 0.9, height: screenSize.height * 0.34)
        contentBackGround.centerX(inView: roudedBackGround)
        
       createSection(bg: contentBackGround, titles: sections)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
