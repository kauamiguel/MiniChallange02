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
    var consultID : MaternityCardViewController?
  
    
    let label = LabelComponentView()
    let data = LabelComponentView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
          
        setupview()
    }
    
    @objc func tapEditbutton(){
        self.tapEditButtonClosure?()
    }
    
    func setupview(){
        
        label.setupLabel(labelText: "Sua consulta".localized(), labelType: .bigTitle, labelColor: .darkPink)
        self.addSubview(label)
        label.anchorWithMultiplayerValues(top: self.topAnchor, left: self.leadingAnchor, topPadding: screenSize.height * 0.002 ,leftPadding: screenSize.width * 0.005)
        
        self.addSubview(data)
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        let date = formatter.string(from: currentDate)
        data.setupLabel(labelText: "\(date)", labelType: .inputLabel, labelColor: .wierdGray)
        data.anchorWithConstantValues(top: label.bottomAnchor, left: self.leadingAnchor, leftPadding: screenSize.width * 0.05)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

