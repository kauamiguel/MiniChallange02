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
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
    }
    
    func configureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        checkBox.setupButton()
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
    }
}
