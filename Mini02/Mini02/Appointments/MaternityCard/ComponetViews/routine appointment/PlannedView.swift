//
//  PlannedView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import UIKit

class PlannedView: UIView {
    
    static let id = "PlannedViewCell"
    let query = "planejamento"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let pregnancyRiskViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.124)
    
    
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
    
    /* ----------------------------------------------------------planned------------------------------------------------------------- */
    
    let plannedLabel = LabelComponentView()
    let plannedLabelYES = LabelComponentView()
    let plannedLabelNO = LabelComponentView()
    
    let plannedCheckYES = CheckBoxComponentGreenView()
    let plannedCheckNO = CheckBoxComponentRedView()
    
    lazy var plannedHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var plannedHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    lazy var plannedSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: pregnancyRiskViewSize.width ,height: pregnancyRiskViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(plannedLabel)
        plannedLabel.setupLabel(labelText: "Gravidez planejada", labelType: .title, labelColor: .black)
        plannedLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor , leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: plannedLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9, height: screenSize.height * 0.081)
        contentBackGround.centerX(inView: roudedBackGround)
//        
        
        configureLabelAndGreenCheckBox(stack: plannedHStackYES, label: plannedLabelYES, checkBox: plannedCheckYES, labelText: "Sim")
  
        
        configureLabelAndRedCheckBox(stack: plannedHStackNO, label: plannedLabelNO, checkBox: plannedCheckNO, labelText: "Não")
       
        
        plannedSubHStack.addArrangedSubview(plannedHStackYES)
        plannedSubHStack.addArrangedSubview(plannedHStackNO)
        contentBackGround.addSubview(plannedSubHStack)
        
        plannedSubHStack.anchorWithConstantValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor, topPadding: 15 ,leftPadding: 20)
      
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



