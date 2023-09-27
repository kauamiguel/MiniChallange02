//
//  PregnantDataView.swift
//  Mini02
//
//  Created by Fabio Freitas on 25/09/23.
//

import UIKit

class PregnantDataView: UIView {
    private var viewController: UIViewController?
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .systemBackground
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var pregnantNameLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Nome da gestante:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private lazy var pregnantNameField: UITextField = {
       let field = UITextField()
        field.backgroundColor = .systemGray
        return field
    }()
    
    private lazy var aliasLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Como gostaria de ser chamada:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private lazy var aliasField: UITextField = {
       let field = UITextField()
        field.backgroundColor = .systemGray
        return field
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Data de nascimento:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private lazy var dateOfBirthPicker: UIDatePicker = {
       var picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .automatic
        picker.setDate(Calendar.current.date(byAdding: .year, value: -18, to: Date())!, animated: false)
        return picker
    }()
    
    private lazy var divider: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var emergencyLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Em caso de emergência, ligar para:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private lazy var emergencyContactNameLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Nome:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private lazy var emergencyContactNameField: UITextField = {
       let field = UITextField()
        field.backgroundColor = .systemGray
        return field
    }()
    
    private lazy var emergencyContactPhoneLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Telefone:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private lazy var emergencyContactPhoneField: UITextField = {
       let field = UITextField()
        field.backgroundColor = .systemGray
        return field
    }()
    
    private lazy var emergencyContactRelationLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Vínculo:", labelType: .subTitle, labelColor: .black)
        return label
    }()
    
    private var emergencyContactRelationField: UITextField = {
       var field = UITextField()
        field.backgroundColor = .systemGray
        return field
    }()
    
    private let profileButtonWidth: CGFloat = 54
    private lazy var profileButton: UIButton = {
        return ProfileImageButton(mode: .Edit, controller: self.viewController)
    }()
    
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
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20),
                ])
    }
    
    func setupButton(controller vc: UIViewController) {
        vc.view.addSubview(profileButton)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            profileButton.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: profileButtonWidth),
            profileButton.heightAnchor.constraint(equalToConstant: profileButtonWidth)
        ])
    }
    
    func setButtonHandler(handler: Selector) {
        profileButton.addTarget(.none, action: handler, for: .touchUpInside)
    }
    
    func updateButton(img: UIImage) {
        profileButton.clipsToBounds = true
        profileButton.contentMode = .scaleAspectFit
        profileButton.setImage(img, for: .normal)
        profileButton.backgroundColor = .systemPink
    }
    
    private func setupImage() {
        contentView.addSubview(profileButton)
        profileButton.centerX(inView: contentView)
        profileButton.anchorWithConstantValues(top: contentView.topAnchor, topPadding: 28, width: profileButtonWidth, height: profileButtonWidth)
    }
    
    private func setupName(vc: UIViewController){
        contentView.addSubview(pregnantNameLabel)
        pregnantNameLabel.anchorWithConstantValues(top: profileButton.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 30, leftPadding: 50, rightPadding: -50)
        contentView.addSubview(pregnantNameField)
        pregnantNameField.anchorWithConstantValues(top: pregnantNameLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: 50, rightPadding: -50, height: 34)
    }
    
    private func setupAlias(vc: UIViewController){
        contentView.addSubview(aliasLabel)
        aliasLabel.anchorWithConstantValues(top: pregnantNameField.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: 50, rightPadding: -50)
        contentView.addSubview(aliasField)
        aliasField.anchorWithConstantValues(top: aliasLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: 50, rightPadding: -50, height: 34)
    }
    
    private func setupDateOfBirth(vc: UIViewController) {
        contentView.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.anchorWithConstantValues(top: aliasField.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: 50, rightPadding: -50)
        contentView.addSubview(dateOfBirthPicker)
        dateOfBirthPicker.anchorWithConstantValues(top: dateOfBirthLabel.bottomAnchor, left: vc.view.leadingAnchor, topPadding: 5, leftPadding: 50, height: 34)
    }
    
    private func setupDivider(vc: UIViewController) {
        contentView.addSubview(divider)
        divider.anchorWithConstantValues(top: dateOfBirthPicker.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 30, leftPadding: 28, rightPadding: -28, height: 1)
    }
    
    private func setupEmergencyLabel(vc: UIViewController) {
        contentView.addSubview(emergencyLabel)
        emergencyLabel.anchorWithConstantValues(top: divider.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 14, leftPadding: 50)
    }
    
    private func setupEmergencyName(vc: UIViewController) {
        contentView.addSubview(emergencyContactNameLabel)
        emergencyContactNameLabel.anchorWithConstantValues(top: emergencyLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: 50, rightPadding: -50)
        contentView.addSubview(emergencyContactNameField)
        emergencyContactNameField.anchorWithConstantValues(top: emergencyContactNameLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: 50, rightPadding: -50, height: 34)
    }
    
    private func setupEmergencyPhone(vc: UIViewController) {
        contentView.addSubview(emergencyContactPhoneLabel)
        emergencyContactPhoneLabel.anchorWithConstantValues(top: emergencyContactNameField.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: 50, rightPadding: -50)
        contentView.addSubview(emergencyContactPhoneField)
        emergencyContactPhoneField.anchorWithConstantValues(top: emergencyContactPhoneLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: 50, rightPadding: -50, height: 34)
    }
    
    func setupEmergencyRelation(vc: UIViewController) {
        contentView.addSubview(emergencyContactRelationLabel)
        emergencyContactRelationLabel.anchorWithConstantValues(top: emergencyContactPhoneField.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 20, leftPadding: 50)
        contentView.addSubview(emergencyContactRelationField)
        emergencyContactRelationField.anchorWithConstantValues(top: emergencyContactRelationLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: 50, rightPadding: -50, height: 34)
    }

    func setupPregnantData(vc: UIViewController) {
        self.viewController = vc
        vc.title = "Dados da Gestante"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.view.backgroundColor = .systemBackground
        setupScrollView(vc: vc)
        setupImage()
        setupName(vc: vc)
        setupAlias(vc: vc)
        setupDateOfBirth(vc: vc)
        setupDivider(vc: vc)
        setupEmergencyLabel(vc: vc)
        setupEmergencyName(vc: vc)
        setupEmergencyPhone(vc: vc)
        setupEmergencyRelation(vc: vc)
    }

}

