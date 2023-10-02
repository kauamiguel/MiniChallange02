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
    
    @objc private func plusButtonTapped(_ sender: UIButton) {
           tapAddViews?()
       }

     func setupView(){
         
         label.setupLabel(labelText: "Adicionar campos a consulta", labelType: .medicText, labelColor: .black)
         
         self.addSubview(addHStack)
         plusButton.anchorWithConstantValues(width: UIScreen.main.bounds.size.width * 0.12 , height:  UIScreen.main.bounds.size.width * 0.12)
         addHStack.addArrangedSubview(plusButton)
         addHStack.addArrangedSubview(label)
         addHStack.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor, topPadding: 15, leftPadding: 15)
         
    }

}

