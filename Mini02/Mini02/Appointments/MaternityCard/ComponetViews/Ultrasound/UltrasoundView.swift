//
//  ultrasoundView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class UltrasoundView: UIView {

    static let id = "UltrasoundCell"
    let query = "ultrasson"
    
    let ultrasoundViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded() ,height:  UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height * 0.5) // get the size of the screen portrait need more logic for landscape// get the size of the screen portrait need more logic for landscape
    
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .cyan
        return view
    }()
    
    let questionLabel1: UILabel = {
        let label = UILabel()
        label.text = "UltrasoundView"
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
    
    
    func setUpView(){
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor,width: ultrasoundViewSize.width ,height: ultrasoundViewSize.height)
        
        roudedBackGround.addSubview(questionLabel1)
        
        self.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: ultrasoundViewSize.width ,height: ultrasoundViewSize.height)
        
        questionLabel1.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 10,leftPadding: 10)
        
        roudedBackGround.addSubview(textField)
        
        textField.anchorWithConstantValues(top: questionLabel1.bottomAnchor,left: questionLabel1.leadingAnchor ,width: 200)
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}
