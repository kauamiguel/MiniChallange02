//
//  Register.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit



class RegisterView: UIView{
    var viewModel: RegisterViewModel?
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Dados da gestante"
        label.textColor = .black
        label.font = label.font.withSize(24)
        return label
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Nome da gestante:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
   
    private lazy var nameTextField : UITextField = {
        let text = UITextField().textField(withPlaceholder: "", size: 20)
        text.textColor = .black
        text.autocorrectionType = .no
        return text
    }()
    
    private lazy var nicknameLabel : UILabel = {
        let label = UILabel()
        label.text = "Como gostaria de ser chamada:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    private lazy var nicknameTextfield : UITextField  = {
        let text = UITextField().textField(withPlaceholder: "", size: 20)
        text.textColor = .black
        text.autocorrectionType = .no
        return text
    }()
    
    private lazy var dateOfBirthLabel : UILabel = {
        let label = UILabel()
        label.text = "Data de nascimento:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    private lazy var dateOfBirthDatePicker : UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .wheels
        date.calendar = .current
        date.setDate(Calendar.current.date(byAdding: .year, value: -18, to: Date())!, animated: false)
        return date
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Seguinte", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 25
        return button
    }()
    
    func setUpRegisterView(vc: UIViewController, vm : RegisterViewModel){
        vc.view.backgroundColor = .white
        viewModel = vm
        let tap = UITapGestureRecognizer(target: vc.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        vc.view.addGestureRecognizer(tap)
        let fieldWidth = min(CGFloat(UIScreen.main.bounds.width * 0.73), 544)
        let container = UIView()
        container.backgroundColor = .clear
        vc.view.addSubview(container)
        container.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, bottom: vc.view.safeAreaLayoutGuide.bottomAnchor)
        
        let profileImage = ProfileImageButton(mode: .Edit, controller: vc)
        container.addSubview(profileImage)
        profileImage.centerX(inView: container)
        profileImage.anchorWithConstantValues(top: container.topAnchor, topPadding: 46, width: profileImage.defaultSize, height: profileImage.defaultSize)
    
        //Top label
        container.addSubview(titleLabel)
        
        titleLabel.centerX(inView: container)
        titleLabel.anchorWithConstantValues(top: profileImage.bottomAnchor, topPadding: 60)
        
        //Questions label constrains
        container.addSubview(nameLabel)
        nameLabel.centerX(inView: container)
        nameLabel.anchorWithConstantValues(top: titleLabel.bottomAnchor, topPadding: 40, width: fieldWidth, height: 35)
     
       
        //First text feields Constrains
        container.addSubview(nameTextField)
        nameTextField.centerX(inView: container)
        nameTextField.anchorWithConstantValues(top: nameLabel.bottomAnchor, width: fieldWidth, height: 35)
        

        //Questions label constrains
        container.addSubview(nicknameLabel)
        nicknameLabel.centerX(inView: container)
        nicknameLabel.anchorWithConstantValues(top: nameTextField.bottomAnchor, topPadding: 20, width: fieldWidth, height: 35)
  
        //Second text feields Constrains
        container.addSubview(nicknameTextfield)
        nicknameTextfield.centerX(inView: container)
        nicknameTextfield.anchorWithConstantValues(top: nicknameLabel.bottomAnchor, width: fieldWidth, height: 35)

        
        //Question label Constrains
        container.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.centerX(inView: container)
        dateOfBirthLabel.anchorWithConstantValues(top: nicknameTextfield.bottomAnchor, topPadding: 10, width: fieldWidth, height: 35)

        
        //Data picker Constrains
        container.addSubview(dateOfBirthDatePicker)
        dateOfBirthDatePicker.centerX(inView: vc.view)
        dateOfBirthDatePicker.anchorWithConstantValues(top: dateOfBirthLabel.bottomAnchor, topPadding: 20,width: fieldWidth, height: 120)

        //Buttons constrains
        container.addSubview(nextButton)
        nextButton.centerX(inView: vc.view)
        nextButton.anchorWithConstantValues(
            top: dateOfBirthDatePicker.bottomAnchor,
            topPadding: 60,
            width: min(CGFloat(UIScreen.main.bounds.width * 0.93), 692),
            height: 60)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel?.didTapNext(nameText: self?.nameTextField.text, nicknameText: self?.nicknameTextfield.text, dateOfBirth: self?.dateOfBirthDatePicker.date ?? Date())
        }), for: .touchUpInside)
    }
    
}
