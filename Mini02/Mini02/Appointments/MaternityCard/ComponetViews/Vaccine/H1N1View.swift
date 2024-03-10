//
//  H1N1View.swift
//  Mini02
//
//  Created by Gabriel Eirado on 04/10/23.
//

import Foundation
import UIKit

class H1N1View: UIView{
    
    static let id = "H1N1ViewCell"
    let query = "vacina h1n1"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let h1N1ViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.14)
  
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

    
    let h1N1subTitleLabel = LabelComponentView()
    
    
    let h1N1YesLabel = LabelComponentView()
    let h1N1YesCheckYES = CheckBoxComponentGreenView()

  
    lazy var h1N1YesSubHStackYES: UIStackView = {
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
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: h1N1ViewSize.width ,height: h1N1ViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
    
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: roudedBackGround.topAnchor, bottom: roudedBackGround.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(h1N1subTitleLabel)
        h1N1subTitleLabel.setupLabel(labelText: "Gripe (H1N1)".localized(), labelType:  .titleRegular, labelColor: .darkPink)
        h1N1subTitleLabel.anchorWithConstantValues(top: contentBackGround.topAnchor, left: contentBackGround.leadingAnchor,topPadding: 15, leftPadding: 15)
        
        invertConfigureLabelAndGreenCheckBox(stack: h1N1YesSubHStackYES, label: h1N1YesLabel, checkBox: h1N1YesCheckYES, labelText: "Campanha Atual".localized())
        
        roudedBackGround.addSubview(h1N1YesSubHStackYES)
        h1N1YesSubHStackYES.anchorWithConstantValues(top: h1N1subTitleLabel.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: 10, leftPadding: 15)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
