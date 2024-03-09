//
//  NextButton.swift
//  Mini02
//
//  Created by Fabio Freitas on 09/10/23.
//

import UIKit

class NextButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        setTitle("Seguinte".localized(), for: .normal)
        setTitleColor(UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1), for: .normal)
        titleLabel?.font = UIFont(name: "Signika-Regular", size: 24)
        layer.cornerRadius = 25
        backgroundColor = UIColor(red: 125/255, green: 34/255, blue: 66/255, alpha: 1)
    }
}
