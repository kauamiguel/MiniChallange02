//
//  LabelComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 22/09/23.
//

import Foundation
import UIKit

class LabelComponentView: UILabel{

    public private(set) var labelText: String? //For Title Text
    public private(set) var labelType: labelTypeEnum? //For Label Type (H1,H2,H3)
    public private(set) var labelColor: colorStyle? // For Label Color
        
    
    func setupLabel(labelText: String, labelType: labelTypeEnum, labelColor: colorStyle){
        self.labelText = labelText
        self.labelType = labelType
        self.labelColor = labelColor
            
        self.configureLabelStyle() //Setup Label Style
        self.configureLabelColor() //Setup Label Color

        let attributedString = NSMutableAttributedString(string: labelText)
        self.attributedText = attributedString //Setup Label to AttributedString for custom font
    }
    
    private func configureLabelColor() {
        switch labelColor {
        case .black:
            self.textColor = .black
        case .grey1:
            self.textColor = .gray
        case .grey2:
            self.textColor = .gray
        case .grey3:
            self.textColor = .gray
        case .white:
            self.textColor = .white
        case .secondaryColor:
            self.textColor = UIColor(red: 0.227, green: 0.651, blue: 0.725, alpha: 1)
        default:
            self.textColor = .white
        }
    }
        
    private func configureLabelStyle() {
        switch labelType {
        case .title:
            self.font = UIFont.boldSystemFont(ofSize: 24)
            
        case .subTitle:
            self.font = UIFont.systemFont(ofSize: 20)
            
        case .medicText:
            self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height * 0.02)
            
        case .smallText:
            self.font = UIFont.systemFont(ofSize: 10)
            
        default:
            self.font = UIFont.systemFont(ofSize: 10)
        }
    }
}
