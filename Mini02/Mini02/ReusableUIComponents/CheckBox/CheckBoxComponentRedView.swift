//
//  CheckBoxComponentRed.swift
//  Mini02
//
//  Created by Gabriel Eirado on 22/09/23.
//

import Foundation
import UIKit


import Foundation
import UIKit

class CheckBoxComponentRedView: UIButton {

    private var imageCheck: UIImage {
        return checked ? UIImage(named: "checkBoxRed")?.withRenderingMode(.alwaysOriginal) ?? UIImage() : UIImage(named: "Property 1=Default")?.withRenderingMode(.alwaysOriginal) ?? UIImage()
    }

    var checked: Bool = false {
        didSet {
            self.setImage(imageCheck, for: .normal)
        }
    }

    func setupButton() {
        backgroundColor = .clear
    
        self.addTarget(self, action: #selector(buttonFunc), for: .touchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.setImage(imageCheck, for: .normal)
        
        // Set the frame of the image view to match the button's bounds
        self.imageView?.frame = self.bounds
    }

    @objc func buttonFunc() {
        checked = !checked
    }

    func getBooleanValue() -> Bool {
        return checked
        print(checked)
    }
}
