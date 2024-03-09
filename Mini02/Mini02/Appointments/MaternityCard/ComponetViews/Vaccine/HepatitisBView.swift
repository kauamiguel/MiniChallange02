//
//  HepatitisBView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 04/10/23.
//

import Foundation
import UIKit

class HepatitisBView: UIView{
    
    static let id = "HepatitisBCell"
    let query = "HepatitisB"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let hepatitisBViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.29)
  
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

   
    let hepatitisBsubTitleLabel = LabelComponentView()
    
    private static var checkboxManager = CheckBoxManager()
    
    let hepatitisBYesLabel = LabelComponentView()
    let hepatitisBYesCheckYES: CheckBoxComponentGreenView = {
        let check = CheckBoxComponentGreenView()
        check.manager = HepatitisBView.checkboxManager
        return check
    }()
    
    let hepatitisBNoLabel = LabelComponentView()
    let hepatitisBNoCheckNO: CheckBoxComponentRedView = {
        let check = CheckBoxComponentRedView()
        check.manager = HepatitisBView.checkboxManager
        return check
    }()

  
    lazy var hepatitisBYesSubHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var hepatitisBNoSubHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
      
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: hepatitisBViewSize.width ,height: hepatitisBViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: roudedBackGround.topAnchor, bottom: roudedBackGround.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(hepatitisBsubTitleLabel)
        hepatitisBsubTitleLabel.setupLabel(labelText: "Hepatite B  AntiHBS".localized(), labelType: .titleRegular, labelColor: .darkPink)
        hepatitisBsubTitleLabel.anchorWithConstantValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor,topPadding: 15, leftPadding: 15)
        
        invertConfigureLabelAndGreenCheckBox(stack: hepatitisBYesSubHStackYES, label: hepatitisBYesLabel, checkBox: hepatitisBYesCheckYES, labelText: "+ (Positivo) Imune".localized())
        invertConfigureLabelAndRedCheckBox(stack: hepatitisBNoSubHStackNO, label: hepatitisBNoLabel, checkBox: hepatitisBNoCheckNO, labelText: "- (Negativo) Esquema completo".localized())
        
        hepatitisBNoLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        roudedBackGround.addSubview(hepatitisBYesSubHStackYES)
        hepatitisBYesSubHStackYES.anchorWithConstantValues(top: hepatitisBsubTitleLabel.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)
        
        roudedBackGround.addSubview(hepatitisBNoSubHStackNO)
        hepatitisBNoSubHStackNO.anchorWithConstantValues(top: hepatitisBYesSubHStackYES.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
