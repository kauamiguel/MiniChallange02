//
//  Register.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    func setUpRegisterView(vc: RegisterViewController){
        
        vc.view.backgroundColor = .white
        
        //Title
        
        let topLabel = UILabel()
        
        topLabel.text = "Dados da gestante"
        topLabel.textColor = .black
        topLabel.font = topLabel.font.withSize(30)
        vc.view.addSubview(topLabel)
        
//        topLabel.centerX(inView: vc.view)
//        topLabel.anchorWithContantValues(top: vc.view.safeAreaLayoutGuide.topAnchor)
        
        // 1
       
        let questionlabel1 = UILabel()
        questionlabel1.text = "Nome da gestante:"
        questionlabel1.textColor = .black
        questionlabel1.font = topLabel.font.withSize(20)

        vc.view.addSubview(questionlabel1)
        
//        questionlabel1.anchorWithContantValues(top: topLabel.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 50 ,leftPadding: 50, rightPadding: -20, height: 35)
        
        let textField1 = UITextField().textField(withPlaceholder: "", size: 20)
        textField1.textColor = .black
        
        vc.view.addSubview(textField1)

//        textField1.anchorWithContantValues(top: questionlabel1.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)
       
        // 2
        let questionlabel2 = UILabel()
        questionlabel2.text = "Como gostaria de ser chamada:"
        questionlabel2.textColor = .black
        questionlabel2.font = topLabel.font.withSize(20)

        vc.view.addSubview(questionlabel2)
        
        questionlabel2.anchorWithContantValues(top: textField1.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 5 ,leftPadding: 50, rightPadding: -20, height: 35)
        
        let textField2 = UITextField().textField(withPlaceholder: "", size: 20)
        textField2.textColor = .black
        
        vc.view.addSubview(textField2)

        textField2.anchorWithContantValues(top: questionlabel2.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)

        // 3
        let questionlabel3 = UILabel()
        questionlabel3.text = "Data de nascimento:"
        questionlabel3.textColor = .black
        questionlabel3.font = topLabel.font.withSize(20)

        vc.view.addSubview(questionlabel3)
        
        questionlabel3.anchorWithContantValues(top: textField2.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 5 ,leftPadding: 50, rightPadding: -20, height: 35)
    
    }
}




