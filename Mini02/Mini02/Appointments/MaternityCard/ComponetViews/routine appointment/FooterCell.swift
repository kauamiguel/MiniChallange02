//
//  footer.swift
//  Mini02
//
//  Created by Gabriel Eirado on 02/10/23.
//

import UIKit


public class FooterCell: UICollectionReusableView {
    static let id = "FooterCell"

    var tapAddViews: (() -> Void)?
    var tapSave: (() -> Void)?
    
    let plusButton: UIButton = {
        let btn = UIButton()
       
        //UI settings of the button
        btn.contentMode = .scaleAspectFill // Set content mode to scaleAspectFill
        btn.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.tintColor = UIColor.darkPink()
        
        return btn
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
        
        btn.backgroundColor = UIColor.darkPink()
        btn.layer.cornerRadius = 6
        
        var chevronImageView = UIImageView()
        
        let chevronImage = UIImage(systemName: "doc.text")
        chevronImageView = UIImageView(image: chevronImage)
        chevronImageView.tintColor = UIColor(red: 0.97, green: 0.95, blue: 0.91, alpha: 1.00)
        
        btn.addSubview(chevronImageView)
        chevronImageView.anchorWithConstantValues(left: btn.leadingAnchor, leftPadding: UIScreen.main.bounds.width * 0.03)
        chevronImageView.centerY(inView: btn)
        
        let label = LabelComponentView()
        label.setupLabel(labelText: "Salvar consulta".localized(), labelType: .inputLabel, labelColor: .notQuiteWhite)
        label.maximumContentSizeCategory = .small
        btn.addSubview(label)
        label.anchorWithMultiplayerValues(left: chevronImageView.trailingAnchor, leftPadding: UIScreen.main.bounds.width * 0.002)
        label.centerY(inView: btn)
     
        return btn
    }()
    
    let label = LabelComponentView()
    
    lazy var addHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    let separator = CustomSeparatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func plusButtonTapped() {
        tapAddViews?()
    }
    
    @objc private func save(){
        tapSave?()
    }

     func setupView(){
         self.addSubview(separator)
         separator.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor, right: self.trailingAnchor, topPadding: UIScreen.main.bounds.size.height * 0.016, leftPadding: UIScreen.main.bounds.size.width * 0.05, rightPadding: -UIScreen.main.bounds.size.width * 0.05, height: 1.5)

         label.setupLabel(labelText: "Adicionar campos a consulta".localized(), labelType: .inputLabel, labelColor: .wierdGray)
         if UIDevice.current.userInterfaceIdiom == .phone {
             label.maximumContentSizeCategory = .extraExtraLarge
         }
         label.maximumContentSizeCategory = .extraExtraExtraLarge
         label.numberOfLines = 2
         label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
         
         self.addSubview(addHStack)
         plusButton.anchorWithConstantValues(width: UIScreen.main.bounds.size.width * 0.12 , height: UIScreen.main.bounds.size.width * 0.12)
         addHStack.addArrangedSubview(plusButton)
         addHStack.addArrangedSubview(label)
         addHStack.anchorWithConstantValues(top: separator.topAnchor, left: self.leadingAnchor, topPadding: UIScreen.main.bounds.height * 0.02, leftPadding: UIScreen.main.bounds.width * 0.04)
         
         self.addSubview(saveButton)
         saveButton.anchorWithConstantValues(top: addHStack.bottomAnchor, left: self.leadingAnchor ,topPadding: UIScreen.main.bounds.height * 0.05, leftPadding:  UIScreen.main.bounds.width * 0.04, width: UIScreen.main.bounds.width * 0.6,height: UIScreen.main.bounds.height * 0.035)
         
    }

}

