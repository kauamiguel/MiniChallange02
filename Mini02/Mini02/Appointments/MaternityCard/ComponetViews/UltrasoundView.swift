//
//  ultrasoundView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class UltrasoundView: UIView {

    static let id = "UltrasoundCell"
    
    lazy var size = UIScreen.main.bounds.size // get the size of the screen portrait need more logic for landscape
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .gray
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
        
        roudedBackGround.anchorWithContantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: (size.width - size.width * 0.03).rounded() ,height: size.height - size.height * 0.5)
        
        roudedBackGround.addSubview(questionLabel1)
        
        questionLabel1.anchorWithContantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 10,leftPadding: 10)
        
        roudedBackGround.addSubview(textField)
        
        textField.anchorWithContantValues(top: questionLabel1.bottomAnchor,left: questionLabel1.leadingAnchor ,width: 200)
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}
