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
        case .primaryText:
            self.textColor = UIColor(red: 255/255, green: 133/255, blue: 148/255, alpha: 1)
        case .secondaryText:
            self.textColor = UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1)
        case .notQuiteWhite:
            self.textColor = UIColor(red: 0.97, green: 0.95, blue: 0.91, alpha: 1.00)
        default:
            self.textColor = .white
        }
    }
        
    private func configureLabelStyle() {
        let customBody = UIFont(name: "Signika-Regular", size: UIScreen.main.bounds.height * 0.035)
        adjustsFontForContentSizeCategory = true
        numberOfLines = 2
        maximumContentSizeCategory = .accessibilityExtraExtraLarge
        switch labelType {
       
        case .titleBold:
            let customTitle2 = UIFont(name: "Signika-Bold", size: 22)
            self.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customTitle2 ?? .preferredFont(forTextStyle: .title3))
            self.numberOfLines = 5
            
        case .titleSemiBold:
            let customTitle3 = UIFont(name: "Signika-Bold", size: 20)
            self.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customTitle3 ?? .preferredFont(forTextStyle: .title3))
            self.numberOfLines = 5
            
        case .titleRegular:
            self.font = UIFont(name: "Signika-Regular", size: UIScreen.main.bounds.height * 0.035)
            
        case .inputLabel:
            let customInputFont = UIFont(name: "Signika-Regular", size: UIScreen.main.bounds.height * 0.02)
            self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customInputFont ?? .preferredFont(forTextStyle: .body))
            
        case .smallInputLabel:
            self.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customBody ?? .preferredFont(forTextStyle: .callout))
            
        case .highlitedBody:
            let customHeadline = UIFont(name: "Signika-Bold", size: 16)
            self.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customHeadline ?? .preferredFont(forTextStyle: .headline))
            
        case .description:
            self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customBody ?? .preferredFont(forTextStyle: .body))
            self.textAlignment = .center
            self.numberOfLines = 5
        default:
            self.font = UIFont.systemFont(ofSize: 10)
        }
    }
}
