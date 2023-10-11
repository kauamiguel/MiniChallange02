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
        
        label.setupLabel(labelText: labelText, labelType: .titleSemiBold, labelColor: .secondaryColor)
       
        checkBox.setupButton()
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
        checkBox.anchorWithConstantValues(width: btnSize, height:  btnSize)
        
    }
    
    func configureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .titleSemiBold, labelColor: .secondaryColor)
        checkBox.setupButton()
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(checkBox)
        checkBox.anchorWithMultiplayerValues(width: btnSize, height: btnSize)

    }
    
    func invertConfigureLabelAndGreenCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentGreenView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .titleSemiBold, labelColor: .secondaryColor)
        checkBox.setupButton()
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        checkBox.anchorWithMultiplayerValues(width: btnSize, height:  btnSize)
    }
    
    func invertConfigureLabelAndRedCheckBox(stack: UIStackView ,label: LabelComponentView, checkBox: CheckBoxComponentRedView, labelText: String) {
        label.setupLabel(labelText: labelText, labelType: .titleSemiBold, labelColor: .secondaryColor)
        checkBox.setupButton()
   
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        checkBox.anchorWithMultiplayerValues(width: btnSize, height: btnSize)

    }

    
    func configureLabelAndPullDonw(stack: UIStackView ,label: LabelComponentView, pullDown: PullDownComponent, labelText: String, screenSize: CGSize) {
        
        label.setupLabel(labelText: labelText, labelType: .titleSemiBold, labelColor: .secondaryColor)
       
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(pullDown)
        pullDown.anchorWithConstantValues(width: screenSize.width * 0.35, height: screenSize.height * 0.035)
        
    }
}
