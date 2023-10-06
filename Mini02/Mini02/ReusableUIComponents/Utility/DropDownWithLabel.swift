//
//  DropDownWithLabel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    func DropDownPlusLabelTop(label: LabelComponentView, dropDown: DropDownMenuComponent, contentBackGround: UIView,topAnchor: UIView ,labelText: String, dropDownOptions: [String], topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        dropDown.setupButton()
        dropDown.tableBarView.setupDropDownOptions = dropDownOptions

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(dropDown)

        label.anchorWithConstantValues(top: topAnchor.topAnchor, left: contentBackGround.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        dropDown.anchorWithConstantValues(top: label.bottomAnchor, left: contentBackGround.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func DropDownPlusLabelBottom(label: LabelComponentView, dropDown: DropDownMenuComponent, contentBackGround: UIView,topAnchor: UIView ,labelText: String, dropDownOptions: [String], topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        dropDown.setupButton()
        dropDown.tableBarView.setupDropDownOptions = dropDownOptions

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(dropDown)

        label.anchorWithConstantValues(top: topAnchor.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        dropDown.anchorWithConstantValues(top: label.bottomAnchor, left: contentBackGround.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }

    
    

}
