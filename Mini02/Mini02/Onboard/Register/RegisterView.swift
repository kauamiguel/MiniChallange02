//
//  Register.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit

protocol RegisterViewDelegate: AnyObject {
    func nextButtonTapped()
}

class RegisterView: UIView{
    
    weak var delegate: RegisterViewDelegate?
    
    func setUpRegisterView(vc: RegisterViewController){
        
        vc.view.backgroundColor = .white
        
        //Title
        
        let topLabel = UILabel()
        
        topLabel.text = "Dados da gestante"
        topLabel.textColor = .black
        topLabel.font = topLabel.font.withSize(30)
        vc.view.addSubview(topLabel)
        
        topLabel.centerX(inView: vc.view)
        topLabel.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor)
        
        // 1
       
        let questionlabel1 = UILabel()
        questionlabel1.text = "Nome da gestante:"
        questionlabel1.textColor = .black
        questionlabel1.font = topLabel.font.withSize(20)

        vc.view.addSubview(questionlabel1)
        
        questionlabel1.anchorWithConstantValues(top: topLabel.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 50 ,leftPadding: 50, rightPadding: -20, height: 35)
        
        let textField1 = UITextField().textField(withPlaceholder: "", size: 20)
        textField1.textColor = .black
        
        vc.view.addSubview(textField1)

        textField1.anchorWithConstantValues(top: questionlabel1.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)
       
        // 2
        let questionlabel2 = UILabel()
        questionlabel2.text = "Como gostaria de ser chamada:"
        questionlabel2.textColor = .black
        questionlabel2.font = topLabel.font.withSize(20)

        vc.view.addSubview(questionlabel2)
        
        questionlabel2.anchorWithConstantValues(top: textField1.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 5 ,leftPadding: 50, rightPadding: -20, height: 35)
        
        let textField2 = UITextField().textField(withPlaceholder: "", size: 20)
        textField2.textColor = .black
        
        vc.view.addSubview(textField2)

        textField2.anchorWithConstantValues(top: questionlabel2.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 2 ,leftPadding: 50, rightPadding: -50, height: 35)

        // 3
        let questionlabel3 = UILabel()
        questionlabel3.text = "Data de nascimento:"
        questionlabel3.textColor = .black
        questionlabel3.font = topLabel.font.withSize(20)

        vc.view.addSubview(questionlabel3)
        
        questionlabel3.anchorWithConstantValues(top: textField2.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 5 ,leftPadding: 50, rightPadding: -20, height: 35)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.calendar = .current
        datePicker.setDate(Calendar.current.date(byAdding: .year, value: -18, to: Date())!, animated: false)
        vc.view.addSubview(datePicker)
        datePicker.anchorWithConstantValues(top: questionlabel3.bottomAnchor, topPadding: 10, height: 120)
        datePicker.centerX(inView: vc.view)
        
        let nextButton = UIButton()
        nextButton.setTitle("Seguinte", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        vc.view.addSubview(nextButton)
        nextButton.centerX(inView: vc.view)
        nextButton.anchorWithConstantValues(left: vc.view.safeAreaLayoutGuide.leadingAnchor,right: vc.view.safeAreaLayoutGuide.trailingAnchor,bottom: vc.view.safeAreaLayoutGuide.bottomAnchor,leftPadding: 14, rightPadding: -14, bottomPadding: -60, height: 45)
    }
    
    @objc private func nextButtonTapped() {
        self.delegate?.nextButtonTapped()
    }
}




