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
    
    private lazy var aliasLabel : UILabel = {
        let label = UILabel()
        label.text = "Como gostaria de ser chamada:"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    private lazy var aliasTextfield : UITextField  = {
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
        button.layer.cornerRadius = 10
        return button
    }()
    
    func setUpRegisterView(vc: UIViewController, vm : RegisterViewModel){
        vc.view.backgroundColor = .white
        viewModel = vm
        
        let profileImage = ProfileImageButton(mode: .Edit, controller: vc)
        vc.view.addSubview(profileImage)
        profileImage.centerX(inView: vc.view)
        profileImage.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, topPadding: 46, width: profileImage.defaultSize, height: profileImage.defaultSize)
    
        //Top label
        vc.view.addSubview(titleLabel)
        
        titleLabel.centerX(inView: vc.view)
        titleLabel.anchorWithConstantValues(top: profileImage.bottomAnchor, topPadding: 60)
    
        
        //Questions label constrains
        vc.view.addSubview(nameLabel)
        
        nameLabel.anchorWithConstantValues(top: titleLabel.bottomAnchor, left: vc.view.leadingAnchor,  topPadding: 40, leftPadding: 45, height: 35)
     
       
        //First text feields Constrains
        vc.view.addSubview(nameTextField)

        nameTextField.anchorWithConstantValues(top: nameLabel.bottomAnchor, left: vc.view.leadingAnchor, leftPadding: 45, width: 288, height: 35)
        

        //Questions label constrains
        vc.view.addSubview(aliasLabel)
        
        aliasLabel.anchorWithConstantValues(top: nameTextField.bottomAnchor, left: vc.view.leadingAnchor, topPadding: 20, leftPadding: 45, height: 35)
  
        
        //Second text feields Constrains
        vc.view.addSubview(aliasTextfield)

        aliasTextfield.anchorWithConstantValues(top: aliasLabel.bottomAnchor, left: vc.view.leadingAnchor, leftPadding: 45, width: 288, height: 35)

        
        //Question label Constrains
        vc.view.addSubview(dateOfBirthLabel)
        
        dateOfBirthLabel.anchorWithConstantValues(top: aliasTextfield.bottomAnchor, left: vc.view.leadingAnchor,topPadding: 10, leftPadding: 45, height: 35)

        
        //Data picker Constrains
        vc.view.addSubview(dateOfBirthDatePicker)
        dateOfBirthDatePicker.centerX(inView: vc.view)
        dateOfBirthDatePicker.anchorWithConstantValues(top: dateOfBirthLabel.bottomAnchor, left: vc.view.leadingAnchor, topPadding: 20, height: 140)

        //Buttons constrains
        vc.view.addSubview(nextButton)
        nextButton.centerX(inView: vc.view)
        nextButton.anchorWithConstantValues(bottom: vc.view.safeAreaLayoutGuide.bottomAnchor, bottomPadding: -60,width: 364, height: 45)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel?.didTapNext(nameText: self?.nameTextField.text, nicknameText: self?.aliasTextfield.text, dateOfBirth: self?.dateOfBirthDatePicker.date ?? Date())
        }), for: .touchUpInside)
    }
    
//    private func didTapNext() {
//        guard let vm = viewModel else { return }
//        let haptics = UINotificationFeedbackGenerator()
//        let isValid = vm.dataIsValid(name: nameTextField.text, alias: aliasTextfield.text, dateOfBirth: dateOfBirthDatePicker.date)
//        guard isValid else {
//            let alert = UIAlertController(title: "Dados Inválidos", message: "Preencha os dados para continuar", preferredStyle: .alert)
//            alert.addAction(.init(title: "Ok", style: .default))
//            haptics.notificationOccurred(.error)
//            vm.viewController?.present(alert, animated: true)
//            return
//        }
//        vm.saveInitialData()
//        haptics.notificationOccurred(.success)
//        vm.sendToMainView()
//    }
    
}




