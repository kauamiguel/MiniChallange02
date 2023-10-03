//
//  RoutineData.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import UIKit

class RoutineDataView: UIView {


    static let id = "RoutineDataCell"
    let query = "rotina"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let routineDataViewSize = CGSize(width: trunc((UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04)), height: UIScreen.main.bounds.size.height * 0.28)
    
    
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
    

    let routineLabel = LabelComponentView()
    
    /* ----------------------------------------------------------IG -DUM/USG------------------------------------------------------------- */
    
    
    let igLabel = LabelComponentView()
    
    let igDropDown = DropDownMenuComponent()

    
    lazy var hypertensionSubVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
        /* ----------------------------------------------------------routine------------------------------------------------------------- */
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: routineDataViewSize.width ,height: routineDataViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(routineLabel)
        routineLabel.setupLabel(labelText: "Dados de rotina", labelType: .title, labelColor: .black)
        routineLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: routineLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10, width: screenSize.width * 0.9)
        contentBackGround.centerX(inView: roudedBackGround)
        
        /* ----------------------------------------------------------IIG -DUM/USG-G------------------------------------------------------------- */

        igLabel.setupLabel(labelText: "IG -DUM/USG", labelType: .medicText, labelColor: .black)
       
        igDropDown.setupButton()
        igDropDown.tableBarView.setupDropDownOptions = ["aaaa", "bbbbb", "ccccc", "ddddd" , "fffffff"]
        
        contentBackGround.addSubview(hypertensionSubVStack)

        contentBackGround.addSubview(igDropDown)
        igDropDown.anchorWithConstantValues(top: contentBackGround.topAnchor ,width: 150, height: 40)

        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
