//
//  DropDownWithLabel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    func menuPlusLabel(label: LabelComponentView, menu: PullDownComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func menuPlusLabelBottom(label: LabelComponentView, menu: PullDownComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.bottomAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }

    
    func menuPlusLabelRight(label: LabelComponentView, menu: PullDownComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat){
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .medicText, labelColor: .black)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.trailingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.trailingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
}
