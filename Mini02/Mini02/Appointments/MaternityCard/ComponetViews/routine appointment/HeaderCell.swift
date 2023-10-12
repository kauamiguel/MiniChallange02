//
//  HeaderCell.swift
//  Mini02
//
//  Created by Gabriel Eirado on 03/10/23.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    
    static let id = "HeaderCell"
    let screenSize = UIScreen.main.bounds.size
    var tapEditButtonClosure: (() -> Void)?
    
  
    
    let label = LabelComponentView()
    let data = LabelComponentView()
    
    lazy var editHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
          
        setupview()
    }
    
    @objc func tapEditbutton(){
        self.tapEditButtonClosure?()
    }
    
    func setupview(){
        
        label.setupLabel(labelText: "Consulta \("1")", labelType: .titleBold, labelColor: .secondaryColor)

        self.addSubview(editHStack)
        editHStack.addArrangedSubview(label)

        editHStack.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor, right: self.trailingAnchor, topPadding: screenSize.height * 0.03 ,leftPadding: screenSize.width * 0.05, rightPadding: -screenSize.width * 0.05)
        self.addSubview(data)
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        let date = formatter.string(from: currentDate)
        data.setupLabel(labelText: "\(date)", labelType: .inputLabel, labelColor: .secondaryText)
        data.anchorWithConstantValues(top: editHStack.bottomAnchor, left: self.leadingAnchor, leftPadding: screenSize.width * 0.05)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

