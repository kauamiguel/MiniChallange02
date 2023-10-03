//
//  HeaderCell.swift
//  Mini02
//
//  Created by Gabriel Eirado on 03/10/23.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    
    static let id = "HeaderCell"
    
    var tapEditButtonClosure: (() -> Void)?
    
    let editButton: UIButton = {
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
        if let image = UIImage(systemName: "square.and.pencil")?.withRenderingMode(.automatic) {
            btnConfig.image = image
        }
        btnConfig.imagePadding = 13
        btn.configuration = btnConfig

        // Set the image tint color
        btn.tintColor = .white
        
        btn.setTitle("Editar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        
        return btn
    }()
    
    let label = LabelComponentView()
    
    lazy var editHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            editButton.addTarget(self, action: #selector(tapEditbutton), for: .touchUpInside)
        setupview()
    }
    
    @objc func tapEditbutton(){
        self.tapEditButtonClosure?()
    }
    
    func setupview(){
        
        label.setupLabel(labelText: "aaaa", labelType: .title, labelColor: .secondaryColor)

        self.addSubview(editHStack)
        editHStack.addArrangedSubview(label)
        editHStack.addArrangedSubview(editButton)
        editButton.anchorWithConstantValues(width: UIScreen.main.bounds.width * 0.32, height: UIScreen.main.bounds.height * 0.035)
        editHStack.anchorWithConstantValues(top: self.topAnchor,left: self.leadingAnchor)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

