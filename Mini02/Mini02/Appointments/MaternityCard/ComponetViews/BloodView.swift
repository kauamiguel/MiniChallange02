//
//  BloodView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class BloodView: UIView {

    static let id = "BloodCell"
//    lazy var size = UIScreen.main.bounds.size
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){

        let roudedBackGround = UIView()
        roudedBackGround.layer.cornerRadius = 10
        roudedBackGround.backgroundColor = .gray
        
//        addSubview(roudedBackGround)
//
//
//        roudedBackGround.anchorWithContantValues(top: self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leadingAnchor,right: self.safeAreaLayoutGuide.trailingAnchor,bottom: self.safeAreaLayoutGuide.bottomAnchor, leftPadding: 1 ,rightPadding: -1, width: size.width - size.width * 0.06, height: 400)
        
        let questionlabel1 = UILabel()
        questionlabel1.text = "BloodView"
        questionlabel1.textColor = .black
        questionlabel1.font = questionlabel1.font.withSize(20)
        
        addSubview(questionlabel1)
        
        questionlabel1.anchorWithContantValues(top: self.topAnchor, left: self.safeAreaLayoutGuide.leadingAnchor,right: self.safeAreaLayoutGuide.trailingAnchor, topPadding: 50 ,leftPadding: 50, rightPadding: -20, height: 35)
        
        let textField1 = UITextField().textField(withPlaceholder: "", size: 20)
        textField1.textColor = .black
        
        addSubview(textField1)
        
        textField1.anchorWithContantValues(top: questionlabel1.bottomAnchor, left: self.safeAreaLayoutGuide.leadingAnchor,right: self.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }


}
