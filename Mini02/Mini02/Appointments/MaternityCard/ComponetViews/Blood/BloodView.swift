//
//  BloodView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class BloodView: UIView{
    
    static let id = "BloodCell"
    let query = "sangue"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let bloodViewViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 0.5)
  
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
        view.layer.borderColor = UIColor(red: 0.91, green: 0.41, blue: 0.41, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
    let separator = CustomSeparatorView()
    let bloodExamLabel = LabelComponentView()
    

    
    let aboLabel = LabelComponentView()
    let aboMenu = PullDownComponent()
    
    let htLabel = LabelComponentView()
    let htMenu = PullDownComponent()
    
    let hbLabel = LabelComponentView()
    let hbMenu = PullDownComponent()
    
    let plaquetasLabel = LabelComponentView()
    let  plaquetasMenu = PullDownComponent()
    
   
    let leucocitosLabel = LabelComponentView()
    let leucocitosMenu = PullDownComponent()
    
    let glicemiaLabel = LabelComponentView()
    let glicemiaMenu = PullDownComponent()
    
    let ureiaLabel = LabelComponentView()
    let ureiaMenu = PullDownComponent()
    
    let creatineLabel = LabelComponentView()
    let creatineMenu  = PullDownComponent()
    

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
 
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: bloodViewViewSize.width ,height: bloodViewViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(bloodExamLabel)
        bloodExamLabel.setupLabel(labelText: "Exame de sangue", labelType: .titleBold, labelColor: .secondaryColor)
        bloodExamLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: bloodExamLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.43)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: 15, bottomPadding: -15, width: 1.5)
        separator.centerX(inView: contentBackGround)
        separator.backgroundColor = UIColor(red: 0.91, green: 0.41, blue: 0.41, alpha: 1.00)
        
        
        menuPlusLabel(label: aboLabel, menu: aboMenu, options: BloodType.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: contentBackGround, labelText: "ABO - RH", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: PICKER HERE - HT AND HB ARE TWO DIFFERENT THINGS
        menuPlusLabelBottom(label: htLabel, menu: htMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: aboMenu, leftAnchor: contentBackGround, labelText: "HTª", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: PICKER HERE - HT AND HB ARE TWO DIFFERENT THINGS
        menuPlusLabelBottom(label: hbLabel, menu: hbMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: htMenu, leftAnchor: contentBackGround, labelText: "HB", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: PICKER HERE
        menuPlusLabelBottom(label: plaquetasLabel, menu: plaquetasMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: hbMenu, leftAnchor: contentBackGround, labelText: "Plaquetas", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
     
        
       // RIGHT
        //FIXME: THIS IS A PICKER WITH TWO VALUES: mg/dl
        menuPlusLabel(label: ureiaLabel, menu: ureiaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: separator, labelText: "Ureia",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        
        
        //FIXME: THIS IS A PICKER
        menuPlusLabelBottom(label: leucocitosLabel, menu: leucocitosMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: ureiaMenu, leftAnchor: separator, labelText: "Leucócitos",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
       
       
        //FIXME: THIS IS A PICKER
        menuPlusLabelBottom(label: glicemiaLabel, menu: glicemiaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: leucocitosMenu, leftAnchor: separator, labelText: "Glicemia",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
    
        
        //FIXME: THIS IS A PICKER WITH TWO VALUES: mg/dl
        menuPlusLabelBottom(label: creatineLabel, menu: creatineMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: glicemiaMenu, leftAnchor: separator, labelText: "Creatina",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
  
      
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
