//
//  DropDownWithLabel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    func menuPlusLabel(label: LabelComponentView, menu: MenuComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(menu)
       
        label.anchorWithConstantValues(top: topAnchor.topAnchor, left: contentBackGround.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithConstantValues(top: label.bottomAnchor, left: contentBackGround.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func menuPlusLabelBottom(label: LabelComponentView, menu: MenuComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(menu)
       
        label.anchorWithConstantValues(top: topAnchor.bottomAnchor, left: contentBackGround.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithConstantValues(top: label.bottomAnchor, left: contentBackGround.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }

    
    

}
