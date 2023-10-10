//
//  FamilyAntecedentView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 29/09/23.
//

import UIKit


class FamilyAntecedentView: UIView {
    
    static let id = "FamilyAntecedentCell"
    let query = "antecedente familiar"
    let labels = [LabelComponentView(),LabelComponentView(),LabelComponentView(),LabelComponentView()]
    let sections = ["Hipertensão", "Diabetes", "Cardiopatia", "Outro", "test"]
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let familyAntecedentViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.31)
    
    
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
    

    let antecedentesLabel = LabelComponentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(){
        
        /* ----------------------------------------------------------Antecedentes------------------------------------------------------------- */
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: familyAntecedentViewSize.width ,height: familyAntecedentViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(antecedentesLabel)
        antecedentesLabel.setupLabel(labelText: "Antecedentes Familiares", labelType: .title, labelColor: .black)
        antecedentesLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: antecedentesLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9, height: screenSize.height * 0.27)
        contentBackGround.centerX(inView: roudedBackGround)
        
        createSection(bg: contentBackGround, labels: labels, titles: sections)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





