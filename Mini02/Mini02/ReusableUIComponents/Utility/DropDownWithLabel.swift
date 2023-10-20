//
//  DropDownWithLabel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import Foundation
import UIKit

extension UIView {
    
    func menuPlusLabel(label: LabelComponentView, menu: PullDownComponent, alternateBackground: Bool = false, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)
        if alternateBackground {
            menu.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
            menu.subviews.compactMap({ $0 as? UIImageView }).forEach( {$0.tintColor = UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1.00)})
        }

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func numericPickerPlusLabel(label: LabelComponentView, menu: NumericPicker, menuMinimum: Int, menuMaximum: Int, menuInterval: Int, menuDefaultValue: Int? = nil ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupNumericPicker(from: menuMinimum, to: menuMaximum, interval: menuInterval, startValue: menuDefaultValue)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func numericFloatPickerPlusLabel(label: LabelComponentView, menu: NumericFloatPicker, menuMinimum: Float, menuMaximum: Float, menuInterval: Float, menuDefaultValue: Float? = nil ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupNumericPicker(from: menuMinimum, to: menuMaximum, interval: menuInterval, startValue: menuDefaultValue)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func textFieldPlusLabel(label: LabelComponentView, field: RoundedTextField, placeholder: String? = nil, alternateBackground: Bool = false, contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        field.layer.cornerRadius = 8
        field.placeholder = placeholder
        if alternateBackground {
            field.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
            if let placeholder {
                let whiteWithOpacity = UIColor(white: 1, alpha: 0.45)
                field.attributedPlaceholder = NSAttributedString(
                    string: placeholder,
                    attributes: [NSAttributedString.Key.foregroundColor: whiteWithOpacity]
                )
            }
        }

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        contentBackGround.addSubview(field)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        field.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
    
    func datePickerPlusLabel(label: LabelComponentView, date: DatePicker , defaultDate: Date? = nil, contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, heightMultiplier: CGFloat) {
        date.setupDatePicker(defaultDate: defaultDate ?? Date(),round: 8)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        contentBackGround.addSubview(date)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        date.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, height: screenSize.height * heightMultiplier)
    }
    
    func menuPlusLabelBottom(label: LabelComponentView, menu: PullDownComponent, options: [String], alternateBackground: Bool = false,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat) {
        
        menu.setupButton(options: options)
        if alternateBackground {
            menu.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
            menu.subviews.compactMap({ $0 as? UIImageView }).forEach( {$0.tintColor = UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1.00)})
        }

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.bottomAnchor, left: leftAnchor.leadingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.leadingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }

    
    func menuPlusLabelRight(label: LabelComponentView, menu: PullDownComponent, options: [String] ,contentBackGround: UIView, topAnchor: UIView, leftAnchor: UIView ,labelText: String, topPadding: CGFloat, leftPadding: CGFloat, screenSize: CGSize, widthMultiplier: CGFloat, heightMultiplier: CGFloat){
        
        menu.setupButton(options: options)

        contentBackGround.addSubview(label)
        label.setupLabel(labelText: labelText, labelType: .inputLabel, labelColor: .secondaryColor)
        label.maximumContentSizeCategory = .extraLarge
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 2
        contentBackGround.addSubview(menu)
       
        label.anchorWithMultiplayerValues(top: topAnchor.topAnchor, left: leftAnchor.trailingAnchor, topPadding: topPadding, leftPadding: leftPadding)
        menu.anchorWithMultiplayerValues(top: label.bottomAnchor, left: leftAnchor.trailingAnchor, leftPadding: leftPadding, width: screenSize.width * widthMultiplier, height: screenSize.height * heightMultiplier)
    }
}
