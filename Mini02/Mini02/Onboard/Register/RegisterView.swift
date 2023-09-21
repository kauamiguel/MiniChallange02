//
//  Register.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit



class RegisterView: UIView{

    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Seguinte", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        return button
    }()
    
    var topLabel : UILabel = {
        let label = UILabel()
        label.text = "Dados da gestante"
        label.textColor = .black
        label.font = label.font.withSize(30)
        return label
    }()
    
    let questionlabel1 : UILabel = {
        let label = UILabel()
        label.text = "Nome da gestante:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
   
    let textField1 : UITextField = {
        let text = UITextField().textField(withPlaceholder: "", size: 20)
        text.textColor = .black
        return text
    }()
    
    let questionlabel2 : UILabel = {
        let label = UILabel()
        label.text = "Como gostaria de ser chamada:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    let textField2 : UITextField  = {
        let text = UITextField().textField(withPlaceholder: "", size: 20)
        text.textColor = .black
        return text
    }()
    
    let questionlabel3 : UILabel = {
        let label = UILabel()
        label.text = "Data de nascimento:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    let datePicker : UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .wheels
        date.calendar = .current
        date.setDate(Calendar.current.date(byAdding: .year, value: -18, to: Date())!, animated: false)
        return date
    }()
    
    
    func setUpRegisterView(vc: UIViewController, action : Selector){
        
        vc.view.backgroundColor = .white
    
        //Top label
        vc.view.addSubview(topLabel)
        
        topLabel.centerX(inView: vc.view)
        topLabel.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor)
    
        
        //Questions label constrains
        vc.view.addSubview(questionlabel1)
        
        questionlabel1.anchorWithConstantValues(top: topLabel.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 50 ,leftPadding: 50, rightPadding: -20, height: 35)
     
       
        //First text feields Constrains
        vc.view.addSubview(textField1)

        textField1.anchorWithConstantValues(top: questionlabel1.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)
        

        //Questions label constrains
        vc.view.addSubview(questionlabel2)
        
        questionlabel2.anchorWithConstantValues(top: textField1.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 5 ,leftPadding: 50, rightPadding: -20, height: 35)
  
        
        //Second text feields Constrains
        vc.view.addSubview(textField2)

        textField2.anchorWithConstantValues(top: questionlabel2.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)

        
        //Question label Constrains
        vc.view.addSubview(questionlabel3)
        
        questionlabel3.anchorWithConstantValues(top: textField2.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 5 ,leftPadding: 50, rightPadding: -20, height: 35)

        
        //Data picker Constrains
        vc.view.addSubview(datePicker)
        datePicker.anchorWithConstantValues(top: questionlabel3.bottomAnchor, topPadding: 10, height: 120)
        datePicker.centerX(inView: vc.view)
        
        
        //Buttons constrains
        self.nextButton.addTarget(vc, action: action, for: .touchUpInside)
        vc.view.addSubview(nextButton)
        nextButton.centerX(inView: vc.view)
        nextButton.anchorWithConstantValues(bottom: vc.view.safeAreaLayoutGuide.bottomAnchor,leftPadding: 14, rightPadding: -14, bottomPadding: -60, height: 45)
    }
}




