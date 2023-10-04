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
    private let fieldWidth = min(CGFloat(UIScreen.main.bounds.width * 0.73), 544)
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .systemBackground
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
        let label = UILabel()
        label.text = "Dados da gestante"
        label.font = label.font.withSize(24)
        return label
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Nome da gestante:"
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
        label.font = label.font.withSize(20)
        return label
    }()
    
    private lazy var dateOfBirthDatePicker : UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .compact
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
        nameTextField.anchorWithConstantValues(top: nameLabel.bottomAnchor, topPadding: 5, width: fieldWidth, height: 34)
    }
    
    private func setupNickname(vc: UIViewController) {
        contentView.addSubview(nicknameLabel)
        nicknameLabel.centerX(inView: contentView)
        nicknameLabel.anchorWithConstantValues(top: nameTextField.bottomAnchor, topPadding: 20, width: fieldWidth)
        contentView.addSubview(nicknameTextfield)
        nicknameTextfield.centerX(inView: contentView)
        nicknameTextfield.anchorWithConstantValues(top: nicknameLabel.bottomAnchor, topPadding: 5, width: fieldWidth, height: 34)
    }
    
    private func setupDatePicker(vc: UIViewController) {
        contentView.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.centerX(inView: contentView)
        dateOfBirthLabel.anchorWithConstantValues(top: nicknameTextfield.bottomAnchor, topPadding: 20, width: fieldWidth)
        contentView.addSubview(dateOfBirthDatePicker)
        dateOfBirthDatePicker.anchorWithConstantValues(top: dateOfBirthLabel.bottomAnchor, left: dateOfBirthLabel.leadingAnchor, topPadding: 5)
    }
    
    private lazy var placeholderIcon: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private func setupPlaceholder(vc: UIViewController) {
        contentView.addSubview(placeholderIcon)
        placeholderIcon.centerX(inView: contentView)
        placeholderIcon.anchorWithConstantValues(top: dateOfBirthDatePicker.bottomAnchor, topPadding: 36, width: 198, height: 198)
    }
    
    private func setupNextButton(vc: UIViewController) {
        contentView.addSubview(nextButton)
        nextButton.centerX(inView: contentView)
        let buttonWidth = max(fieldWidth, 364)
        nextButton.anchorWithConstantValues(top: placeholderIcon.bottomAnchor, topPadding: 36, bottomPadding: 60, width: buttonWidth, height: 66)
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
