//
//  PregnantDataView.swift
//  Mini02
//
//  Created by Fabio Freitas on 25/09/23.
//

import UIKit

class PregnantDataView: UIView {
    private let paddingSize: CGFloat =  {
        let baseSize = UIScreen.main.bounds.width * 0.115
        if (UIScreen.main.bounds.width > UIScreen.main.bounds.height) {
            return min(UIScreen.main.bounds.width * 0.115, 900)
        }
        
        return baseSize
    }()
    private var viewController: UIViewController?
    private var viewModel: PregnantDataViewModel?
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var pregnantNameLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Nome da gestante:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var pregnantNameField: UITextField = {
        let field = RoundedTextField()
        field.text = viewModel?.getPatientData()?.firstName
        return field
    }()
    
    private lazy var aliasLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Como gostaria de ser chamada:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var aliasField: UITextField = {
       let field = RoundedTextField()
        field.text = viewModel?.getPatientData()?.nickName
        return field
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Data de nascimento:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var dateOfBirthPicker: UIDatePicker = {
       var picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .automatic
        if let dateOfBirth = viewModel?.getPatientData()?.dateOfBirth {
            picker.setDate(dateOfBirth, animated: false)
        }
        picker.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        picker.layer.cornerRadius = 18
        picker.clipsToBounds = true
        picker.tintColor = UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1)
        return picker
    }()
    
    private lazy var divider: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        return view
    }()
    
    private lazy var emergencyLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Em caso de emergência, ligar para:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var emergencyContactNameLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Nome:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var emergencyContactNameField: UITextField = {
       let field = RoundedTextField()
        field.text = viewModel?.getPatientData()?.emergencyContact?.name
        return field
    }()
    
    private lazy var emergencyContactPhoneLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Telefone:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var emergencyContactPhoneField: UITextField = {
       let field = RoundedTextField()
        field.text = viewModel?.getPatientData()?.emergencyContact?.phone
        return field
    }()
    
    private lazy var emergencyContactRelationLabel: UILabel = {
        let label = LabelComponentView()
        label.setupLabel(labelText: "Vínculo:", labelType: .inputLabel, labelColor: .secondaryText)
        return label
    }()
    
    private lazy var profileButton = ProfileImageButton(mode: .Edit, controller: self.viewController)
    
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
        profileButton.anchorWithConstantValues(top: contentView.topAnchor, topPadding: 28, width: profileButton.defaultSize, height: profileButton.defaultSize)
    }
    
    private func setupName(vc: UIViewController){
        contentView.addSubview(pregnantNameLabel)
        pregnantNameLabel.anchorWithConstantValues(top: profileButton.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 30, leftPadding: paddingSize, rightPadding: -paddingSize)
        contentView.addSubview(pregnantNameField)
        pregnantNameField.anchorWithConstantValues(top: pregnantNameLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: paddingSize, rightPadding: -paddingSize, height: 40)
    }
    
    private func setupAlias(vc: UIViewController){
        contentView.addSubview(aliasLabel)
        aliasLabel.anchorWithConstantValues(top: pregnantNameField.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: paddingSize, rightPadding: -paddingSize)
        contentView.addSubview(aliasField)
        aliasField.anchorWithConstantValues(top: aliasLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: paddingSize, rightPadding: -paddingSize, height: 40)
    }
    
    private func setupDateOfBirth(vc: UIViewController) {
        contentView.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.anchorWithConstantValues(top: aliasField.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: paddingSize, rightPadding: -paddingSize)
        contentView.addSubview(dateOfBirthPicker)
        dateOfBirthPicker.anchorWithConstantValues(top: dateOfBirthLabel.bottomAnchor, left: vc.view.leadingAnchor, topPadding: 5, leftPadding: paddingSize, height: 34)
    }
    
    private func setupDivider(vc: UIViewController) {
        let dividerPadding = UIScreen.main.bounds.width * 0.071
        contentView.addSubview(divider)
        divider.anchorWithConstantValues(top: dateOfBirthPicker.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 30, leftPadding: dividerPadding, rightPadding: -dividerPadding, height: 1)
    }
    
    private func setupEmergencyLabel(vc: UIViewController) {
        contentView.addSubview(emergencyLabel)
        emergencyLabel.anchorWithConstantValues(top: divider.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 14, leftPadding: paddingSize)
    }
    
    private func setupEmergencyName(vc: UIViewController) {
        contentView.addSubview(emergencyContactNameLabel)
        emergencyContactNameLabel.anchorWithConstantValues(top: emergencyLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: paddingSize, rightPadding: -paddingSize)
        contentView.addSubview(emergencyContactNameField)
        emergencyContactNameField.anchorWithConstantValues(top: emergencyContactNameLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: paddingSize, rightPadding: -paddingSize, height: 40)
    }
    
    private func setupEmergencyPhone(vc: UIViewController) {
        contentView.addSubview(emergencyContactPhoneLabel)
        emergencyContactPhoneLabel.anchorWithConstantValues(top: emergencyContactNameField.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor,topPadding: 20, leftPadding: paddingSize, rightPadding: -50)
        contentView.addSubview(emergencyContactPhoneField)
        emergencyContactPhoneField.anchorWithConstantValues(top: emergencyContactPhoneLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: paddingSize, rightPadding: -paddingSize, height: 40)
    }
    private lazy var relationPullDown = PullDownComponent()
    func setupEmergencyRelation(vc: UIViewController) {
        contentView.addSubview(emergencyContactRelationLabel)
        emergencyContactRelationLabel.anchorWithConstantValues(top: emergencyContactPhoneField.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 20, leftPadding: paddingSize)
        
        relationPullDown.setupButton(options: ["Companheiro", "Familiar", "Amigo", "Outro(a)"])
        relationPullDown.setTitle("Selecione", for: .normal)
        contentView.addSubview(relationPullDown)
        relationPullDown.anchorWithConstantValues(top: emergencyContactRelationLabel.bottomAnchor, left: vc.view.leadingAnchor, right: vc.view.trailingAnchor, topPadding: 5, leftPadding: paddingSize, rightPadding: -paddingSize, height: 34)
    }
    
    private func setupTempSaveButton(vc: UIViewController) {
        let btn: UIButton = UIButton(configuration: .plain())
        btn.setTitle("Salvar", for: .normal)
        btn.addAction(UIAction(handler: { [weak self] _ in
            self?.didTapTempSaveButton()
        }), for: .touchUpInside)
        contentView.addSubview(btn)
        btn.anchorWithConstantValues(top: relationPullDown.bottomAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 40, rightPadding: -paddingSize)
    }
    
    private func didTapTempSaveButton() {
        guard let viewModel else { return }
        let alert = UIAlertController(title: "Dados Inválidos", message: "Verifique se todos os campos estão preenchidos e tente novamente", preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        let haptics = UINotificationFeedbackGenerator()
        let profileDataIsValid = viewModel.profileDataIsValid(name: pregnantNameField.text, nickname: aliasField.text, dateOfBirth: dateOfBirthPicker.date, emergencyContactName: emergencyContactNameField.text, emergencyContactPhone: emergencyContactPhoneField.text, emergencyContactRelation: relationPullDown.selectedOption)
        guard profileDataIsValid else {
            viewController?.present(alert, animated: true)
            haptics.notificationOccurred(.error)
            return
        }
        viewModel.saveProfileData()
        alert.title = "Sucesso!"
        alert.message = "Seu perfil foi atualizado com sucesso!"
        haptics.notificationOccurred(.success)
        viewController?.present(alert, animated: true)
    }
    
    func setupToolbarAndBG(vc: UIViewController) {
        vc.navigationController?.navigationItem.largeTitleDisplayMode = .always
        vc.navigationController?.navigationItem.titleView?.backgroundColor = .clear
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Signika-Regular", size: 24)]
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.shadowColor = .clear
        barAppearance.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        barAppearance.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
        barAppearance.largeTitleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
        vc.navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.backgroundColor = .clear
        vc.navigationController?.navigationBar.isTranslucent = true
        vc.navigationController?.navigationBar.standardAppearance = barAppearance
        vc.navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        vc.navigationController?.toolbar.backgroundColor = .clear
        let toolbarAppearance = UIToolbarAppearance()
        toolbarAppearance.backgroundColor = .clear
        toolbarAppearance.shadowColor = .clear
        vc.navigationController?.toolbar.backgroundColor = .clear
        vc.navigationController?.toolbar.compactAppearance = toolbarAppearance
        vc.navigationController?.toolbar.standardAppearance = toolbarAppearance
        vc.navigationController?.toolbar.scrollEdgeAppearance = toolbarAppearance
        vc.navigationController?.toolbar.compactScrollEdgeAppearance = toolbarAppearance
        vc.view.backgroundColor = UIColor(patternImage: UIImage(named: "backGroundImage")!)

    }
    
    func setupNavBar(vc: UIViewController) {
        let image = UIImage(systemName: "info.circle")!
        let button = UIBarButtonItem(title: "Sobre o Projeto", image: image, target: viewModel, action:  #selector(viewModel?.didTapInfoButton))
        button.tintColor = UIColor(red: 0.227, green: 0.651, blue: 0.725, alpha: 1)
        vc.navigationItem.rightBarButtonItem = button
    }

    func setupPregnantData(vc: UIViewController,vm: PregnantDataViewModel) {
        self.viewController = vc
        self.viewModel = vm
        vc.title = "Dados da Gestante"
        
        setupNavBar(vc: vc)
        setupToolbarAndBG(vc: vc)
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

