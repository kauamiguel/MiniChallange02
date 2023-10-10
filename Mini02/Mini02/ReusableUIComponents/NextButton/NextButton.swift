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
        setTitle("Seguinte", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Signika-Regular", size: 24)
        backgroundColor = .lightGray
        layer.cornerRadius = 25
        backgroundColor = UIColor(red: 255/255, green: 133/255, blue: 148/255, alpha: 1)
    }
}
