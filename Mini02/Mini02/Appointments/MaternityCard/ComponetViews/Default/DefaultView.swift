//
//  DefaultView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class DefaultView: UIView{
    
    static let id = "DefaultCell"
    
    let defaultViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded() ,height:  UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height * 0.5) // get the size of the screen portrait need more logic for landscape
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .gray
        return view
    }()
    
    let questionLabel1: UILabel = {
        let label = UILabel()
        label.text = "DefaultView"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField().textField(withPlaceholder: "", size: 20)
        textField.textColor = .red
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    let checkBox = CheckBoxComponentGreen()
    let checkBoxRed = CheckBoxComponentRed()
    
    func setUpView(){
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: defaultViewSize.width ,height: defaultViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        roudedBackGround.addSubview(questionLabel1)
        
        questionLabel1.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 10,leftPadding: 10)
        
        roudedBackGround.addSubview(textField)
        
        textField.anchorWithConstantValues(top: questionLabel1.bottomAnchor,left: questionLabel1.leadingAnchor ,width: 200)
        
        roudedBackGround.addSubview(checkBox)
        checkBox.anchorWithConstantValues(top: textField.bottomAnchor)
        checkBox.centerX(inView: self)
        checkBox.setupButton()
        
        roudedBackGround.addSubview(checkBoxRed)
        checkBoxRed.anchorWithConstantValues(right: checkBox.trailingAnchor, rightPadding: 50)
        checkBoxRed.setupButton()

        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}
