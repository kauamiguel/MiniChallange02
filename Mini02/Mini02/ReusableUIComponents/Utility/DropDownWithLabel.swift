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
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func numericPickerPlusLabel(label: LabelComponentView, menu: NumericPicker, menuMinimum: Int, menuMaximum: Int, menuInterval: Int, menuDefaultValue: Int? = nil ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupNumericPicker(from: menuMinimum, to: menuMaximum, interval: menuInterval, startValue: menuDefaultValue)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func numericFloatPickerPlusLabel(label: LabelComponentView, menu: NumericFloatPicker, menuMinimum: Float, menuMaximum: Float, menuInterval: Float, menuDefaultValue: Float? = nil ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupNumericPicker(from: menuMinimum, to: menuMaximum, interval: menuInterval, startValue: menuDefaultValue)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func textFieldPlusLabel(label: LabelComponentView, field: RoundedTextField, placeholder: String? = nil, contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        field.layer.cornerRadius = 8
        field.placeholder = placeholder

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(field)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        field.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func datePickerPlusLabel(label: LabelComponentView, date: DatePicker , defaultDate: Date? = nil, contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, heightMultiplier: CGFloat) {
        date.setupDatePicker(defaultDate: defaultDate ?? Date(),round: 8)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(date)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        date.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, height: screenSize.height * heightMultiplier)
    }
    
    func menuPlusLabelBottom(label: LabelComponentView, menu: PullDownComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.bottomAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }

    
    func menuPlusLabelRight(label: LabelComponentView, menu: PullDownComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat){
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.trailingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.trailingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
}
