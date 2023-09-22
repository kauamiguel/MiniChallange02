//
//  LabelComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 22/09/23.
//

import Foundation
import UIKit

class LabelComponent: UILabel{

    enum labelTypeEnum {
        case H1
        case H2
        case H3
    }
    
    enum colorStyle {
        case black
        case grey1
        case grey2
        case grey3
        case white
    }
    
    public private(set) var labelText: String? //For Title Text
    public private(set) var labelType: labelTypeEnum? //For Label Type (H1,H2,H3)
    public private(set) var labelColor: colorStyle? // For Label Color
        
    
    func setupLabel(labelText: String, labelType: labelTypeEnum, labelColor: colorStyle){
        self.labelText = labelText
        self.labelType = labelType
        self.labelColor = labelColor
            
        self.configureLabelStyle() //Setup Label Style
        self.configureLabelColor() //Setup Label Color

        self.translatesAutoresizingMaskIntoConstraints = false //For AutoLayout
        let attributedString = NSMutableAttributedString(string: labelText)
        self.attributedText = attributedString //Setup Label to AttributedString for custom font
    }
    
    private func configureLabelColor() {
        switch labelColor {
        case .black:
            self.textColor = UIColor(named: "black")
        case .grey1:
            self.textColor = UIColor(named: "grey1")
        case .grey2:
            self.textColor = UIColor(named: "grey2")
        case .grey3:
            self.textColor = UIColor(named: "grey3")
        case .white:
            self.textColor = UIColor(named: "white")
        default:
            self.textColor = UIColor(named: "white")
        }
    }
        
    private func configureLabelStyle() {
        switch labelType {
        case .H1:
            self.font = UIFont(name: "Poppins-Bold", size: 24)
        case .H2:
            self.font = UIFont(name: "Poppins-Bold", size: 16)
        case .H3:
            self.font = UIFont(name: "Poppins-Bold", size: 12)
        default:
            self.font = UIFont(name: "Poppins-Bold", size: 12)
        }
    }
}
