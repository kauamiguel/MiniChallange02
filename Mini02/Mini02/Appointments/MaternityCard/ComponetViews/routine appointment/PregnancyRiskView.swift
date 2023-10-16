//
//  PregnancyRisk.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import UIKit

class PregnancyRiskView: UIView {
    
    static let id = "PregnancyRiskCell"
    let query = "gravidez"
    private static var checkboxManager = CheckBoxManager()
    
    lazy var riscoHabitualGreenCheckbox: CheckBoxComponentGreenView = {
       let checkbox = CheckBoxComponentGreenView()
        checkbox.manager = PregnancyRiskView.checkboxManager
        return checkbox
    }()
    
    lazy var altoRiscoHabitualGreenCheckbox: CheckBoxComponentGreenView = {
       let checkbox = CheckBoxComponentGreenView()
        checkbox.manager = PregnancyRiskView.checkboxManager
        return checkbox
    }()
    
    var section: [String: CheckBoxComponentGreenView] {
        return [
            AppointmentsKeys.riscoHabitual.rawValue.localized() :riscoHabitualGreenCheckbox,
            AppointmentsKeys.altoRisco.rawValue.localized() : altoRiscoHabitualGreenCheckbox
        ]
    }
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let pregnancyRiskViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.17)
    
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
   
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.96, alpha: 1.00)
        
        view.layer.borderWidth = 1 // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.49, green: 0.74, blue: 0.50, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
    /* ----------------------------------------------------------risk------------------------------------------------------------- */
    
    let riskLabel = LabelComponentView()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: pregnancyRiskViewSize.width ,height: pregnancyRiskViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        
        /* ----------------------------------------------------------risk------------------------------------------------------------- */
        
        self.addSubview(riskLabel)
        riskLabel.setupLabel(labelText: "Risco da gravidez".localized(), labelType: .titleBold, labelColor: .secondaryColor)
        riskLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        if UIDevice.current.userInterfaceIdiom == .phone {
            riskLabel.maximumContentSizeCategory = .extraLarge
        }
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: riskLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9, height: screenSize.height * 0.13)
        contentBackGround.centerX(inView: roudedBackGround)
       
        createSection(bg: contentBackGround, titles: section)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


