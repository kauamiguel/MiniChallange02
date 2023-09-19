//
//  DefaultView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class DefaultView: UIView {
    
    static let id = "DefaultCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){

        
        let questionlabel1 = UILabel()
        questionlabel1.text = "DefaultView"
        questionlabel1.textColor = .white
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
