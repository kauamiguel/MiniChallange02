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
    
    let plusButton: UIButton = {
        let btn = UIButton()
       
        //UI settings of the button
        btn.contentMode = .scaleAspectFill // Set content mode to scaleAspectFill
        btn.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.tintColor = UIColor(red: 1.00, green: 0.52, blue: 0.58, alpha: 1.00)
        
        return btn
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
        
        // Set the background color and corner radius to make it a rounded rectangle
        btn.backgroundColor = UIColor(red: 1, green: 0.521, blue: 0.58, alpha: 1)
        btn.layer.cornerRadius = 8 // Adjust the corner radius to your preference
        
        
        var btnConfig = UIButton.Configuration.borderless()
        btnConfig.titleAlignment = .trailing
        btnConfig.imagePlacement = .leading
    
        btnConfig.titleLineBreakMode = .byWordWrapping
        btn.tintColor = UIColor(red: 1, green: 0.521, blue: 0.58, alpha: 1)
        // Create a template image so it scales without distortion
        if let image = UIImage(systemName: "doc.text")?.withRenderingMode(.automatic) {
            btnConfig.image = image
        }
        btnConfig.imagePadding = 35
        
        btn.configuration = btnConfig

        // Set the image tint color
        btn.tintColor = .white
        
        btn.setTitle("Salvar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "YourFontName", size: 16)
        
        return btn
    }()
    
    let label = LabelComponentView()
    
    lazy var addHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    @objc private func plusButtonTapped() {
        tapAddViews?()
    }

     func setupView(){
         
         label.setupLabel(labelText: "Adicionar campos a consulta", labelType: .medicText, labelColor: .black)
         
         self.addSubview(addHStack)
         plusButton.anchorWithConstantValues(width: UIScreen.main.bounds.size.width * 0.12 , height:  UIScreen.main.bounds.size.width * 0.12)
         addHStack.addArrangedSubview(plusButton)
         addHStack.addArrangedSubview(label)
         addHStack.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor, topPadding: 15, leftPadding: 15)
         
         self.addSubview(saveButton)
         saveButton.anchorWithConstantValues(top: addHStack.bottomAnchor, left: self.leadingAnchor ,leftPadding: 15, width: UIScreen.main.bounds.width * 0.46, height: UIScreen.main.bounds.height * 0.035)
         
    }

}

