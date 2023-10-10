//
//  StackViews.swift
//  Mini02
//
//  Created by Gabriel Eirado on 28/09/23.
//

import Foundation
import UIKit

extension UIView {
    
    var btnSize:CGFloat {
        UIScreen.main.bounds.height * 0.03
    }
    func configureLabelAndGreenCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentGreenView, labelText: String) {
        
        
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
       
        checkBox.setupButton()
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
        //label.anchorWithConstantValues(left: stack.leadingAnchor, leftPadding: 15)
        checkBox.anchorWithConstantValues(width: btnSize, height:  btnSize)
        
    
    }
    
    func configureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
        checkBox.anchorWithMultiplayerValues(width: btnSize, height: btnSize)

    }
    
    func invertConfigureLabelAndGreenCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentGreenView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        checkBox.anchorWithMultiplayerValues(width: btnSize, height:  btnSize)
    }
    
    func invertConfigureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
   
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        checkBox.anchorWithMultiplayerValues(width: btnSize, height: btnSize)

    }

}
