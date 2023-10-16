//
//  RoundedTextField.swift
//  Mini02
//
//  Created by Fabio Freitas on 06/10/23.
//

import UIKit

class RoundedTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        layer.cornerRadius = 20.0
        clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 0.051*UIScreen.main.bounds.width, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always
        textColor = .black
        adjustsFontForContentSizeCategory = true
        let customFont = UIFont(name: "Signika-Regular", size: 18)
        font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont ?? .preferredFont(forTextStyle: .title3))
//        font = customFont
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
}
