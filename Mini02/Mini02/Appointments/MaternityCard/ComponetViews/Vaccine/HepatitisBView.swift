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
    let query = "vacina hepatite"
    
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
    let firstDoseLabel = LabelComponentView()
    let secondDoseLabel = LabelComponentView()
    let thirdDoseLabel = LabelComponentView()
    lazy var firstDoseDate : DatePicker = {
        let date = DatePicker()
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .compact
        date.calendar = .current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let customDate = dateFormatter.date(from: "31/12/2023") {
            date.setDate(customDate, animated: false)
        }

        clipsToBounds = true
        tintColor = UIColor.darkPink()
        return date
    }()
    lazy var secondDoseDate : DatePicker = {
        let date = DatePicker()
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .compact
        date.calendar = .current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let customDate = dateFormatter.date(from: "31/12/2023") {
            date.setDate(customDate, animated: false)
        }
        
        clipsToBounds = true
        tintColor = UIColor.darkPink()
        return date
    }()
    
    lazy var thirdDoseDate : DatePicker = {
        let date = DatePicker()
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .compact
        date.calendar = .current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let customDate = dateFormatter.date(from: "31/12/2023") {
            date.setDate(customDate, animated: false)
        }
        
        clipsToBounds = true
        tintColor = UIColor.darkPink()
        return date
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
        hepatitisBsubTitleLabel.setupLabel(labelText: "Hepatite B  AntiHBS".localized(), labelType:  .titleRegular, labelColor: .darkPink)
        hepatitisBsubTitleLabel.anchorWithConstantValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor,topPadding: 15, leftPadding: 15)
        
        invertConfigureLabelAndGreenCheckBox(stack: hepatitisBYesSubHStackYES, label: hepatitisBYesLabel, checkBox: hepatitisBYesCheckYES, labelText: "+ (Positivo) Imune".localized())
        invertConfigureLabelAndRedCheckBox(stack: hepatitisBNoSubHStackNO, label: hepatitisBNoLabel, checkBox: hepatitisBNoCheckNO, labelText: "- (Negativo) Esquema completo".localized())
        
        hepatitisBNoLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        roudedBackGround.addSubview(hepatitisBYesSubHStackYES)
        hepatitisBYesSubHStackYES.anchorWithConstantValues(top: hepatitisBsubTitleLabel.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)
        
        roudedBackGround.addSubview(hepatitisBNoSubHStackNO)
        hepatitisBNoSubHStackNO.anchorWithConstantValues(top: hepatitisBYesSubHStackYES.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)
        
        contentBackGround.addSubview(firstDoseLabel)
        firstDoseLabel.setupLabel(labelText: "Dose 1", labelType: .titleSemiBold, labelColor: .darkPink)
        firstDoseLabel.anchorWithMultiplayerValues(top: hepatitisBNoSubHStackNO.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 2, leftPadding: 2)
        contentBackGround.addSubview(firstDoseDate)
        firstDoseDate.anchorWithMultiplayerValues(top: firstDoseLabel.bottomAnchor,left: contentBackGround.leadingAnchor, leftPadding: 1)
        firstDoseDate.anchorWithConstantValues(width: screenSize.width * 0.25)
        
        contentBackGround.addSubview(secondDoseDate)
        secondDoseDate.anchorWithMultiplayerValues(left: firstDoseDate.trailingAnchor, leftPadding: 2)
        contentBackGround.addSubview(secondDoseLabel)
        secondDoseLabel.setupLabel(labelText: "Dose 2", labelType: .titleSemiBold, labelColor: .darkPink)
        secondDoseLabel.anchorWithMultiplayerValues(top: hepatitisBNoSubHStackNO.bottomAnchor, left: secondDoseDate.leadingAnchor,bottom: secondDoseDate.topAnchor,topPadding: 2, leftPadding: 2)
        secondDoseDate.anchorWithConstantValues(width: screenSize.width * 0.25)
        
        contentBackGround.addSubview(thirdDoseDate)
        thirdDoseDate.anchorWithMultiplayerValues(left: secondDoseDate.trailingAnchor, leftPadding: 2)
        contentBackGround.addSubview(thirdDoseLabel)
        thirdDoseLabel.setupLabel(labelText: "Dose 3", labelType: .titleSemiBold, labelColor: .darkPink)
        thirdDoseLabel.anchorWithMultiplayerValues(top: hepatitisBNoSubHStackNO.bottomAnchor,left: thirdDoseDate.leadingAnchor, bottom: thirdDoseDate.topAnchor,topPadding: 2, leftPadding: 2)
        thirdDoseDate.anchorWithConstantValues(width: screenSize.width * 0.25)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
