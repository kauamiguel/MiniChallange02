//
//  StackViews.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import Foundation
import UIKit

extension UIView {
    func configureLabelAndGreenCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentGreenView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
        
        //LABEL CONSTRAINS
        let screenSize = UIScreen.main.bounds
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
        label.font = UIFont(name: "Signika-Semibold", size: screenSize.width * 0.03 + 10 )
      
        checkBox.anchorWithConstantValues(width: (UIScreen.main.bounds.width * 0.9) * 0.08, height:  (UIScreen.main.bounds.width * 0.9) * 0.08)
      
        
        let sep = CustomSeparatorView()
        //Add separator as a subview
       
        stack.addSubview(sep)
        //Sets separator width and height
        sep.anchorWithConstantValues(
            width: screenSize.width * 0.9,
            height: 2
        )
        //Sets separator anchor to be below the section
        sep.anchorWithConstantValues(
            top: stack.bottomAnchor,
            left: stack.leadingAnchor,
            topPadding: 6,
            leftPadding: -10
        )
    }
    
    func configureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
        checkBox.anchorWithConstantValues(width: (UIScreen.main.bounds.width * 0.9) * 0.08, height: (UIScreen.main.bounds.width * 0.9) * 0.08)

    }
    
    func invertConfigureLabelAndGreenCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentGreenView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        checkBox.anchorWithConstantValues(width: (UIScreen.main.bounds.width * 0.9) * 0.08, height:  (UIScreen.main.bounds.width * 0.9) * 0.08)
    }
    
    func invertConfigureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
   
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        checkBox.anchorWithConstantValues(width: (UIScreen.main.bounds.width * 0.9) * 0.08, height: (UIScreen.main.bounds.width * 0.9) * 0.08)

    }

}
