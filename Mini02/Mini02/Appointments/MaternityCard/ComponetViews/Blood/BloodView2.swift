//
//  BloodView2.swift
//  Mini02
//
//  Created by Gabriel Eirado on 04/10/23.
//

import Foundation
import UIKit

class BloodView2: UIView{
    
    static let id = "BloodCell2"
    let query = "sangue2"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let bloodView2size = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.18)
  
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.97, alpha: 1.00)
        
        view.layer.borderWidth = SeparatorWidth.extern.value // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.91, green: 0.41, blue: 0.41, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
   
    
    let hivLabel = LabelComponentView()
    
    let hivCheckYES = CheckBoxComponentGreenView()

    
    lazy var hivSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    let toxoplasmosisLabel = LabelComponentView()
    let igm = LabelComponentView()
    let igg = LabelComponentView()
    
    let igmCheckYES = CheckBoxComponentGreenView()
    let iggCheckYES = CheckBoxComponentGreenView()
  
    lazy var igmSubHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var iggSubHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var igmAndIggSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var toxoplasmosisHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    

    let vdrlLabel = LabelComponentView()
    
    let vdrlMenu = PullDownComponent()
 
    
    
    lazy var twinSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    
    
    let inseminationLabel = LabelComponentView()
    
    let inseminationCheckYES = CheckBoxComponentGreenView()
   
    
    
    lazy var inseminationSubHStack: UIStackView = {
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
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: bloodView2size.width ,height: bloodView2size.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: roudedBackGround.topAnchor, bottom: roudedBackGround.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        configureLabelAndGreenCheckBox(stack: hivSubHStack,label: hivLabel,checkBox: hivCheckYES,labelText: "Hiv")
        
        contentBackGround.addSubview(hivSubHStack)
        hivSubHStack.anchorWithConstantValues(top: contentBackGround.topAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
   
        toxoplasmosisLabel.setupLabel(labelText: "Toxoplasmose".localized(), labelType: .titleSemiBold, labelColor: .secondaryColor)
        configureLabelAndGreenCheckBox(stack: igmSubHStackYES, label: igm, checkBox: igmCheckYES, labelText: "IGM")
        configureLabelAndGreenCheckBox(stack: iggSubHStackYES, label: igg, checkBox: iggCheckYES, labelText: "IGG")
        
        igmAndIggSubHStack.addArrangedSubview(igmSubHStackYES)
        igmAndIggSubHStack.addArrangedSubview(iggSubHStackYES)
        
        contentBackGround.addSubview(toxoplasmosisHStack)
        toxoplasmosisHStack.addArrangedSubview(toxoplasmosisLabel)
        toxoplasmosisHStack.addArrangedSubview(igmAndIggSubHStack)
        
        toxoplasmosisHStack.anchorWithConstantValues(top: hivSubHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15, leftPadding: 10,rightPadding: -34)
        
        //FIXME: THIS IS A DROPDOWN/PICKER
        configureLabelAndPullDown(stack: twinSubHStack, label: vdrlLabel, pullDown: vdrlMenu, labelText: "VDRL", screenSize: screenSize)
        vdrlMenu.setupButton(options: VdrlExam.allCases.map{$0.rawValue})
        vdrlMenu.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        vdrlMenu.subviews.compactMap({ $0 as? UIImageView }).forEach( {$0.tintColor = UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1.00)})
        contentBackGround.addSubview(twinSubHStack)
        twinSubHStack.anchorWithConstantValues(top: toxoplasmosisHStack.bottomAnchor,left: contentBackGround.leadingAnchor, right: contentBackGround.trailingAnchor, topPadding: 15,leftPadding: 10 ,rightPadding: -34)
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
