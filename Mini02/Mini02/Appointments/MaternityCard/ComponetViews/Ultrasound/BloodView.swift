//
//  BloodView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class BloodView: UIView {

    static let id = "BloodCell"
    
    let bloodViewViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded() ,height:  UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height * 0.5) // get the size of the screen portrait need more logic for landscapee // get the size of the screen portrait need more logic for landscape
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemRed
        return view
    }()
    
    
    let questionLabel1: UILabel = {
        let label = UILabel()
        label.text = "BloodView"
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
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: bloodViewViewSize.width ,height: bloodViewViewSize.height)
        
        roudedBackGround.addSubview(questionLabel1)
        
        self.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: bloodViewViewSize.width ,height: bloodViewViewSize.height)
        
        questionLabel1.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 10,leftPadding: 10)
        
        roudedBackGround.addSubview(textField)
        
        textField.anchorWithConstantValues(top: questionLabel1.bottomAnchor,left: questionLabel1.leadingAnchor ,width: 200)
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

}
