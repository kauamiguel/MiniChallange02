//
//  Register.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit



class RegisterView: UIView{
    var viewController: RegisterViewController?
    var viewModel: RegisterViewModel?
    
    private let textColor = UIColor(red: 255/255, green: 133/255, blue: 148/255, alpha: 1)
    
    private let fieldWidth = min(CGFloat(UIScreen.main.bounds.width * 0.73), 544)
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = LabelComponentView()
        let text = "Dados da gestante".localized()
        label.setupLabel(labelText: text, labelType: .titleRegular, labelColor: .primaryText)
        return label
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = LabelComponentView()
        let text = "Nome da gestante:".localized()
        label.setupLabel(labelText: text, labelType: .inputLabel, labelColor: .primaryText)
        return label
    }()
   
    private lazy var nameTextField : UITextField = {
        let text = RoundedTextField()
        return text
    }()
    
    private lazy var nicknameLabel : UILabel = {
        let label = LabelComponentView()
        let text = "Como gostaria de ser chamada:".localized()
        label.setupLabel(labelText: text, labelType: .inputLabel, labelColor: .primaryText)
        return label
    }()
    
    private lazy var nicknameTextfield : UITextField  = {
        let text = RoundedTextField()
        return text
    }()
    
    private lazy var dateOfBirthLabel : UILabel = {
        let label = LabelComponentView()
        let text = "Data de nascimento:".localized()
        label.setupLabel(labelText: text, labelType: .inputLabel, labelColor: .primaryText)
        return label
    }()
    
    private lazy var dateOfBirthDatePicker : UIDatePicker = {
        let date = DatePicker()
        date.setupDatePicker()
        return date
    }()
    
    private lazy var nextButton: UIButton = {
        let button = NextButton()
        return button
    }()
    
    private func setupDismissKeyboard(vc: UIViewController) {
        let tap = UITapGestureRecognizer(target: vc.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        vc.view.addGestureRecognizer(tap)
    }
    
    private func setupScrollView(vc: UIViewController) {
        vc.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
                    scrollView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),

                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                ])
    }
    
    private lazy var profileButton = ProfileImageButton(mode: .Edit, controller: viewController!)
    private func setupProfileImage(vc: UIViewController) {
        contentView.addSubview(profileButton)
        profileButton.centerX(inView: contentView)
        profileButton.anchorWithConstantValues(top: contentView.topAnchor, topPadding: 18, width: profileButton.defaultSize, height: profileButton.defaultSize)
    }
    
    private func setupTitle() {
        contentView.addSubview(titleLabel)
        titleLabel.centerX(inView: contentView)
        titleLabel.anchorWithConstantValues(top: profileButton.bottomAnchor, topPadding: 48)
    }
    
    private func setupName(vc: UIViewController) {
        contentView.addSubview(nameLabel)
        nameLabel.centerX(inView: contentView)
        nameLabel.anchorWithConstantValues(top: titleLabel.bottomAnchor, topPadding: 36, width: fieldWidth)
        contentView.addSubview(nameTextField)
        nameTextField.centerX(inView: contentView)
        nameTextField.anchorWithConstantValues(top: nameLabel.bottomAnchor, topPadding: 5, width: fieldWidth, height: 40)
    }
    
    private func setupNickname(vc: UIViewController) {
        contentView.addSubview(nicknameLabel)
        nicknameLabel.centerX(inView: contentView)
        nicknameLabel.anchorWithConstantValues(top: nameTextField.bottomAnchor, topPadding: 20, width: fieldWidth)
        contentView.addSubview(nicknameTextfield)
        nicknameTextfield.centerX(inView: contentView)
        nicknameTextfield.anchorWithConstantValues(top: nicknameLabel.bottomAnchor, topPadding: 5, width: fieldWidth, height: 40)
    }
    
    private func setupDatePicker(vc: UIViewController) {
        contentView.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.centerX(inView: contentView)
        dateOfBirthLabel.anchorWithConstantValues(top: nicknameTextfield.bottomAnchor, topPadding: 20, width: fieldWidth)
        contentView.addSubview(dateOfBirthDatePicker)
        dateOfBirthDatePicker.anchorWithConstantValues(top: dateOfBirthLabel.bottomAnchor, left: dateOfBirthLabel.leadingAnchor, topPadding: 5)
    }
    
    private lazy var illustration: UIImageView = {
        let img = UIImage(named: "RegisterIllustration")
       let view = UIImageView(image: img)
        return view
    }()
    
    private func setupPlaceholder(vc: UIViewController) {
        contentView.addSubview(illustration)
        illustration.centerX(inView: contentView)
        illustration.anchorWithConstantValues(top: dateOfBirthDatePicker.bottomAnchor, topPadding: 36, width: 198, height: 198)
    }
    
    private func setupNextButton(vc: UIViewController) {
        contentView.addSubview(nextButton)
        nextButton.centerX(inView: contentView)
        nextButton.anchorWithConstantValues(top: illustration.bottomAnchor, topPadding: 36, bottomPadding: 60, width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.078)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.viewModel?.didTapNext(nameText: self?.nameTextField.text, nicknameText: self?.nicknameTextfield.text, dateOfBirth: self?.dateOfBirthDatePicker.date ?? Date())
        }), for: .touchUpInside)
    }
    
    func setUpRegisterView(vc: UIViewController, vm : RegisterViewModel){
        vc.view.backgroundColor = .systemBackground
        viewModel = vm
        setupDismissKeyboard(vc: vc)
        setupScrollView(vc: vc)
        setupProfileImage(vc: vc)
        setupTitle()
        setupName(vc: vc)
        setupNickname(vc: vc)
        setupDatePicker(vc: vc)
        setupPlaceholder(vc: vc)
        setupNextButton(vc: vc)
        
    }
    
}
